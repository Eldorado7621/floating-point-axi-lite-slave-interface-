-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;


entity apatb_gravity_top is
  generic (
       AUTOTB_CLOCK_PERIOD_DIV2 :   TIME := 5.00 ns;
       AUTOTB_TVIN_m1 : STRING := "./c.gravity.autotvin_m1.dat";
       AUTOTB_TVIN_m2 : STRING := "./c.gravity.autotvin_m2.dat";
       AUTOTB_TVIN_distc : STRING := "./c.gravity.autotvin_distc.dat";
       AUTOTB_TVIN_m1_out_wrapc : STRING := "./rtl.gravity.autotvin_m1.dat";
       AUTOTB_TVIN_m2_out_wrapc : STRING := "./rtl.gravity.autotvin_m2.dat";
       AUTOTB_TVIN_distc_out_wrapc : STRING := "./rtl.gravity.autotvin_distc.dat";
       AUTOTB_TVOUT_ap_return : STRING := "./c.gravity.autotvout_ap_return.dat";
       AUTOTB_TVOUT_ap_return_out_wrapc : STRING := "./impl_rtl.gravity.autotvout_ap_return.dat";
      AUTOTB_LAT_RESULT_FILE    : STRING  := "gravity.result.lat.rb";
      AUTOTB_PER_RESULT_TRANS_FILE    : STRING  := "gravity.performance.result.transaction.xml";
      LENGTH_m1     : INTEGER := 1;
      LENGTH_m2     : INTEGER := 1;
      LENGTH_distc     : INTEGER := 1;
      LENGTH_ap_return     : INTEGER := 1;
	    AUTOTB_TRANSACTION_NUM    : INTEGER := 10
);

end apatb_gravity_top;

architecture behav of apatb_gravity_top is 
  signal AESL_clock	:   STD_LOGIC := '0';
  signal rst      :   STD_LOGIC;
  signal dut_rst  :   STD_LOGIC;
  signal start    :   STD_LOGIC := '0';
  signal ce       :   STD_LOGIC;
  signal continue :   STD_LOGIC := '0';
  signal AESL_reset :   STD_LOGIC := '0';
  signal AESL_start :   STD_LOGIC := '0';
  signal AESL_ce :   STD_LOGIC := '0';
  signal AESL_continue :   STD_LOGIC := '0';
  signal AESL_ready :   STD_LOGIC := '0';
  signal AESL_idle :   STD_LOGIC := '0';
  signal AESL_done :   STD_LOGIC := '0';
  signal AESL_done_delay :   STD_LOGIC := '0';
  signal AESL_done_delay2 :   STD_LOGIC := '0';
  signal AESL_ready_delay :   STD_LOGIC := '0';
  signal ready :   STD_LOGIC := '0';
  signal ready_wire :   STD_LOGIC := '0';

  signal CRTLS_AWADDR:  STD_LOGIC_VECTOR (5 DOWNTO 0);
  signal CRTLS_AWVALID:  STD_LOGIC;
  signal CRTLS_AWREADY:  STD_LOGIC;
  signal CRTLS_WVALID:  STD_LOGIC;
  signal CRTLS_WREADY:  STD_LOGIC;
  signal CRTLS_WDATA:  STD_LOGIC_VECTOR (31 DOWNTO 0);
  signal CRTLS_WSTRB:  STD_LOGIC_VECTOR (3 DOWNTO 0);
  signal CRTLS_ARADDR:  STD_LOGIC_VECTOR (5 DOWNTO 0);
  signal CRTLS_ARVALID:  STD_LOGIC;
  signal CRTLS_ARREADY:  STD_LOGIC;
  signal CRTLS_RVALID:  STD_LOGIC;
  signal CRTLS_RREADY:  STD_LOGIC;
  signal CRTLS_RDATA:  STD_LOGIC_VECTOR (31 DOWNTO 0);
  signal CRTLS_RRESP:  STD_LOGIC_VECTOR (1 DOWNTO 0);
  signal CRTLS_BVALID:  STD_LOGIC;
  signal CRTLS_BREADY:  STD_LOGIC;
  signal CRTLS_BRESP:  STD_LOGIC_VECTOR (1 DOWNTO 0);
  signal CRTLS_INTERRUPT:  STD_LOGIC;
  signal ap_local_block :  STD_LOGIC;
  signal ap_clk :  STD_LOGIC;
  signal ap_rst_n :  STD_LOGIC;

  signal ready_cnt : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal done_cnt	: STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal ready_initial  :	STD_LOGIC;
  signal ready_initial_n	:   STD_LOGIC;
  signal ready_last_n   :	STD_LOGIC;
  signal ready_delay_last_n	:   STD_LOGIC;
  signal done_delay_last_n	:   STD_LOGIC;
  signal interface_done :	STD_LOGIC := '0';
  -- Subtype for random state number, to prevent confusing it with true integers
  -- Top of range should be (2**31)-1 but this literal calculation causes overflow on 32-bit machines
  subtype T_RANDINT is integer range 1 to integer'high;

  type latency_record is array(0 to AUTOTB_TRANSACTION_NUM + 1) of INTEGER;
  shared variable AESL_mLatCnterIn : latency_record;
  shared variable AESL_mLatCnterOut : latency_record;
  shared variable AESL_mLatCnterIn_addr : INTEGER;
  shared variable AESL_mLatCnterOut_addr : INTEGER;
  shared variable AESL_mThrCnterIn : latency_record;
  shared variable AESL_mThrCnterIn_addr : INTEGER;
  signal AESL_clk_counter : INTEGER;
  signal AESL_start_p1 : STD_LOGIC := '0';
  signal AESL_ready_p1 : STD_LOGIC := '0';
  signal lat_total : INTEGER;
  signal reported_stuck : STD_LOGIC   := '0';
  shared variable reported_stuck_cnt : INTEGER := 0;
component gravity is
port (
    ap_local_block :  OUT STD_LOGIC;
    ap_clk :  IN STD_LOGIC;
    ap_rst_n :  IN STD_LOGIC;
    s_axi_CRTLS_AWVALID :  IN STD_LOGIC;
    s_axi_CRTLS_AWREADY :  OUT STD_LOGIC;
    s_axi_CRTLS_AWADDR :  IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    s_axi_CRTLS_WVALID :  IN STD_LOGIC;
    s_axi_CRTLS_WREADY :  OUT STD_LOGIC;
    s_axi_CRTLS_WDATA :  IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    s_axi_CRTLS_WSTRB :  IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    s_axi_CRTLS_ARVALID :  IN STD_LOGIC;
    s_axi_CRTLS_ARREADY :  OUT STD_LOGIC;
    s_axi_CRTLS_ARADDR :  IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    s_axi_CRTLS_RVALID :  OUT STD_LOGIC;
    s_axi_CRTLS_RREADY :  IN STD_LOGIC;
    s_axi_CRTLS_RDATA :  OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    s_axi_CRTLS_RRESP :  OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    s_axi_CRTLS_BVALID :  OUT STD_LOGIC;
    s_axi_CRTLS_BREADY :  IN STD_LOGIC;
    s_axi_CRTLS_BRESP :  OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    interrupt :  OUT STD_LOGIC);
end component;

-- The signal of port m1
shared variable AESL_REG_m1 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
-- The signal of port m2
shared variable AESL_REG_m2 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
-- The signal of port distc
shared variable AESL_REG_distc : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
-- The signal of port ap_local_deadlock
shared variable AESL_REG_ap_local_deadlock : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
    signal AESL_slave_output_done : STD_LOGIC;
    signal AESL_slave_start : STD_LOGIC;
    signal AESL_slave_start_lock : STD_LOGIC := '0';
    signal AESL_slave_write_start_in : STD_LOGIC;
    signal AESL_slave_write_start_finish : STD_LOGIC;
    signal AESL_slave_ready : STD_LOGIC;
    signal AESL_slave_done : STD_LOGIC;
    signal slave_start_status : STD_LOGIC := '0';
    signal start_rise : STD_LOGIC := '0';
    signal ready_rise : STD_LOGIC := '0';
    signal slave_done_status : STD_LOGIC := '0';
    signal ap_done_lock : STD_LOGIC := '0';
    signal CRTLS_read_data_finish : STD_LOGIC;
    signal CRTLS_write_data_finish : STD_LOGIC;
component AESL_AXI_SLAVE_CRTLS is
  port(
    clk   :   IN STD_LOGIC;
    reset :   IN STD_LOGIC;
    TRAN_s_axi_CRTLS_AWADDR : OUT STD_LOGIC_VECTOR;
    TRAN_s_axi_CRTLS_AWVALID : OUT STD_LOGIC;
    TRAN_s_axi_CRTLS_AWREADY : IN STD_LOGIC;
    TRAN_s_axi_CRTLS_WVALID : OUT STD_LOGIC;
    TRAN_s_axi_CRTLS_WREADY : IN STD_LOGIC;
    TRAN_s_axi_CRTLS_WDATA : OUT STD_LOGIC_VECTOR;
    TRAN_s_axi_CRTLS_WSTRB : OUT STD_LOGIC_VECTOR;
    TRAN_s_axi_CRTLS_ARADDR : OUT STD_LOGIC_VECTOR;
    TRAN_s_axi_CRTLS_ARVALID : OUT STD_LOGIC;
    TRAN_s_axi_CRTLS_ARREADY : IN STD_LOGIC;
    TRAN_s_axi_CRTLS_RVALID : IN STD_LOGIC;
    TRAN_s_axi_CRTLS_RREADY : OUT STD_LOGIC;
    TRAN_s_axi_CRTLS_RDATA : IN STD_LOGIC_VECTOR;
    TRAN_s_axi_CRTLS_RRESP : IN STD_LOGIC_VECTOR;
    TRAN_s_axi_CRTLS_BVALID : IN STD_LOGIC;
    TRAN_s_axi_CRTLS_BREADY : OUT STD_LOGIC;
    TRAN_s_axi_CRTLS_BRESP : IN STD_LOGIC_VECTOR;
    TRAN_CRTLS_interrupt   : IN STD_LOGIC;
    TRAN_CRTLS_read_data_finish : OUT STD_LOGIC;
    TRAN_CRTLS_write_data_finish : OUT STD_LOGIC;
    TRAN_CRTLS_ready_out : OUT STD_LOGIC;
    TRAN_CRTLS_ready_in  : IN STD_LOGIC;
    TRAN_CRTLS_done_out  : OUT STD_LOGIC;
    TRAN_CRTLS_idle_out  : OUT STD_LOGIC;
    TRAN_CRTLS_write_start_in     : IN  STD_LOGIC;
    TRAN_CRTLS_write_start_finish : OUT STD_LOGIC;
    TRAN_CRTLS_transaction_done_in    : IN STD_LOGIC;
    TRAN_CRTLS_start_in    : IN STD_LOGIC
);
end component;

      procedure esl_read_token (file textfile: TEXT; textline: inout LINE; token: out STRING; token_len: out INTEGER) is
          variable whitespace : CHARACTER;
          variable i : INTEGER;
          variable ok: BOOLEAN;
          variable buff: STRING(1 to token'length);
      begin
          ok := false;
          i := 1;
          loop_main: while not endfile(textfile) loop
              if textline = null or textline'length = 0 then
                  readline(textfile, textline);
              end if;
              loop_remove_whitespace: while textline'length > 0 loop
                  if textline(textline'left) = ' ' or
                      textline(textline'left) = HT or
                      textline(textline'left) = CR or
                      textline(textline'left) = LF then
                      read(textline, whitespace);
                  else
                      exit loop_remove_whitespace;
                  end if;
              end loop;
              loop_aesl_read_token: while textline'length > 0 and i <= buff'length loop
                  if textline(textline'left) = ' ' or
                     textline(textline'left) = HT or
                     textline(textline'left) = CR or
                     textline(textline'left) = LF then
                      exit loop_aesl_read_token;
                  else
                      read(textline, buff(i));
                      i := i + 1;
                  end if;
                  ok := true;
              end loop;
              if ok = true then
                  exit loop_main;
              end if;
          end loop;
          buff(i) := ' ';
          token := buff;
          token_len:= i-1;
      end procedure esl_read_token;

      procedure esl_read_token (file textfile: TEXT;
                                textline: inout LINE;
                                token: out STRING) is
          variable i : INTEGER;
      begin
          esl_read_token (textfile, textline, token, i);
      end procedure esl_read_token;

      function esl_str2lv_hex (RHS : STRING; data_width : INTEGER) return STD_LOGIC_VECTOR is
          variable	ret	:   STD_LOGIC_VECTOR(data_width - 1 downto 0);
          variable	idx	:   integer := 3;
      begin
          ret := (others => '0');
          if(RHS(1) /= '0' and (RHS(2) /= 'x' or RHS(2) /= 'X')) then
     	        report "Error! The format of hex number is not initialed by 0x";
          end if;
          while true loop
              if (data_width > 4) then
                  case RHS(idx)  is
                      when '0'    =>  ret := ret(data_width - 5 downto 0) & "0000";
     	                when '1'    =>  ret := ret(data_width - 5 downto 0) & "0001";
                      when '2'    =>  ret := ret(data_width - 5 downto 0) & "0010";
                      when '3'    =>  ret := ret(data_width - 5 downto 0) & "0011";
                      when '4'    =>  ret := ret(data_width - 5 downto 0) & "0100";
                      when '5'    =>  ret := ret(data_width - 5 downto 0) & "0101";
                      when '6'    =>  ret := ret(data_width - 5 downto 0) & "0110";
                      when '7'    =>  ret := ret(data_width - 5 downto 0) & "0111";
                      when '8'    =>  ret := ret(data_width - 5 downto 0) & "1000";
                      when '9'    =>  ret := ret(data_width - 5 downto 0) & "1001";
                      when 'a' | 'A'  =>  ret := ret(data_width - 5 downto 0) & "1010";
                      when 'b' | 'B'  =>  ret := ret(data_width - 5 downto 0) & "1011";
                      when 'c' | 'C'  =>  ret := ret(data_width - 5 downto 0) & "1100";
                      when 'd' | 'D'  =>  ret := ret(data_width - 5 downto 0) & "1101";
                      when 'e' | 'E'  =>  ret := ret(data_width - 5 downto 0) & "1110";
                      when 'f' | 'F'  =>  ret := ret(data_width - 5 downto 0) & "1111";
                      when 'x' | 'X'  =>  ret := ret(data_width - 5 downto 0) & "XXXX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);	return ret;
                  end case;
              elsif (data_width = 4) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "0000";
     	                when '1'    =>  ret := "0001";
                      when '2'    =>  ret := "0010";
                      when '3'    =>  ret := "0011";
                      when '4'    =>  ret := "0100";
                      when '5'    =>  ret := "0101";
                      when '6'    =>  ret := "0110";
                      when '7'    =>  ret := "0111";
                      when '8'    =>  ret := "1000";
                      when '9'    =>  ret := "1001";
                      when 'a' | 'A'  =>  ret := "1010";
                      when 'b' | 'B'  =>  ret := "1011";
                      when 'c' | 'C'  =>  ret := "1100";
                      when 'd' | 'D'  =>  ret := "1101";
                      when 'e' | 'E'  =>  ret := "1110";
                      when 'f' | 'F'  =>  ret := "1111";
                      when 'x' | 'X'  =>  ret := "XXXX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);	return ret;
                  end case;
              elsif (data_width = 3) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "000";
     	                when '1'    =>  ret := "001";
                      when '2'    =>  ret := "010";
                      when '3'    =>  ret := "011";
                      when '4'    =>  ret := "100";
                      when '5'    =>  ret := "101";
                      when '6'    =>  ret := "110";
                      when '7'    =>  ret := "111";
                      when 'x' | 'X'  =>  ret := "XXX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);	return ret;
                  end case;
              elsif (data_width = 2) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "00";
     	                when '1'    =>  ret := "01";
                      when '2'    =>  ret := "10";
                      when '3'    =>  ret := "11";
                      when 'x' | 'X'  =>  ret := "XX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);	return ret;
                  end case;
              elsif (data_width = 1) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "0";
     	                when '1'    =>  ret := "1";
                      when 'x' | 'X'  =>  ret := "X";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);	return ret;
                  end case;
              else
                  report string'("Wrong data_width.");
                  return ret;
              end if;
              idx := idx + 1;
          end loop;
          return ret;
      end function;

    function esl_str_dec2int (RHS : STRING) return INTEGER is
        variable	ret	:   integer;
        variable	idx	:   integer := 1;
    begin
        ret := 0;
        while true loop
            case RHS(idx)  is
                when '0'    =>  ret := ret * 10 + 0;
                when '1'    =>  ret := ret * 10 + 1;
                when '2'    =>  ret := ret * 10 + 2;
                when '3'    =>  ret := ret * 10 + 3;
                when '4'    =>  ret := ret * 10 + 4;
                when '5'    =>  ret := ret * 10 + 5;
                when '6'    =>  ret := ret * 10 + 6;
                when '7'    =>  ret := ret * 10 + 7;
                when '8'    =>  ret := ret * 10 + 8;
                when '9'    =>  ret := ret * 10 + 9;
                when ' '    =>  return ret;
                when others    =>  report "Wrong dec char " & RHS(idx);	return ret;
            end case;
            idx := idx + 1;
        end loop;
        return ret;
    end esl_str_dec2int;
      function esl_conv_string_hex (lv : STD_LOGIC_VECTOR) return STRING is
          constant str_len : integer := (lv'length + 3)/4;
          variable ret : STRING (1 to str_len);
          variable i, tmp: INTEGER;
          variable normal_lv : STD_LOGIC_VECTOR(lv'length - 1 downto 0);
          variable tmp_lv : STD_LOGIC_VECTOR(3 downto 0);
      begin
          normal_lv := lv;
          for i in 1 to str_len loop
              if(i = 1) then
                  if((lv'length mod 4) = 3) then
                      tmp_lv(2 downto 0) := normal_lv(lv'length - 1 downto lv'length - 3);
                      case tmp_lv(2 downto 0) is
                          when "000" => ret(i) := '0';
                          when "001" => ret(i) := '1';
                          when "010" => ret(i) := '2';
                          when "011" => ret(i) := '3';
                          when "100" => ret(i) := '4';
                          when "101" => ret(i) := '5';
                          when "110" => ret(i) := '6';
                          when "111" => ret(i) := '7';
                          when others  => ret(i) := 'X';
                      end case;
                  elsif((lv'length mod 4) = 2) then
                      tmp_lv(1 downto 0) := normal_lv(lv'length - 1 downto lv'length - 2);
                      case tmp_lv(1 downto 0) is
                          when "00" => ret(i) := '0';
                          when "01" => ret(i) := '1';
                          when "10" => ret(i) := '2';
                          when "11" => ret(i) := '3';
                          when others => ret(i) := 'X';
                      end case;
                  elsif((lv'length mod 4) = 1) then
                      tmp_lv(0 downto 0) := normal_lv(lv'length - 1 downto lv'length - 1);
                      case tmp_lv(0 downto 0) is
                          when "0" => ret(i) := '0';
                          when "1" => ret(i) := '1';
                          when others=> ret(i) := 'X';
                      end case;
                  elsif((lv'length mod 4) = 0) then
                      tmp_lv(3 downto 0) := normal_lv(lv'length - 1 downto lv'length - 4);
                      case tmp_lv(3 downto 0) is
                          when "0000" => ret(i) := '0';
                          when "0001" => ret(i) := '1';
                          when "0010" => ret(i) := '2';
                          when "0011" => ret(i) := '3';
                          when "0100" => ret(i) := '4';
                          when "0101" => ret(i) := '5';
                          when "0110" => ret(i) := '6';
                          when "0111" => ret(i) := '7';
                          when "1000" => ret(i) := '8';
                          when "1001" => ret(i) := '9';
                          when "1010" => ret(i) := 'a';
                          when "1011" => ret(i) := 'b';
                          when "1100" => ret(i) := 'c';
                          when "1101" => ret(i) := 'd';
                          when "1110" => ret(i) := 'e';
                          when "1111" => ret(i) := 'f';
                          when others   => ret(i) := 'X';
                      end case;
                  end if;
              else
                  tmp_lv(3 downto 0) := normal_lv((str_len - i) * 4 + 3 downto (str_len - i) * 4);
                  case tmp_lv(3 downto 0) is
                      when "0000" => ret(i) := '0';
                      when "0001" => ret(i) := '1';
                      when "0010" => ret(i) := '2';
                      when "0011" => ret(i) := '3';
                      when "0100" => ret(i) := '4';
                      when "0101" => ret(i) := '5';
                      when "0110" => ret(i) := '6';
                      when "0111" => ret(i) := '7';
                      when "1000" => ret(i) := '8';
                      when "1001" => ret(i) := '9';
                      when "1010" => ret(i) := 'a';
                      when "1011" => ret(i) := 'b';
                      when "1100" => ret(i) := 'c';
                      when "1101" => ret(i) := 'd';
                      when "1110" => ret(i) := 'e';
                      when "1111" => ret(i) := 'f';
                      when others   => ret(i) := 'X';
                  end case;
              end if;
          end loop;
          return ret;
      end function;

  -- purpose: initialise the random state variable based on an integer seed
  function init_rand(seed : integer) return T_RANDINT is
    variable result : T_RANDINT;
  begin
    -- If the seed is smaller than the minimum value of the random state variable, use the minimum value
    if seed < T_RANDINT'low then
      result := T_RANDINT'low;
      -- If the seed is larger than the maximum value of the random state variable, use the maximum value
    elsif seed > T_RANDINT'high then
      result := T_RANDINT'high;
      -- If the seed is within the range of the random state variable, just use the seed
    else
      result := seed;
    end if;
    -- Return the result
    return result;
  end init_rand;


  -- purpose: generate a random integer between min and max limits
  procedure rand_int(variable rand   : inout T_RANDINT;
                     constant minval : in    integer;
                     constant maxval : in    integer;
                     variable result : out   integer
                     ) is

    variable k, q      : integer;
    variable real_rand : real;
    variable res       : integer;

  begin
    -- Create a new random integer in the range 1 to 2**31-1 and put it back into rand VARIABLE
    -- Based on an example from Numerical Recipes in C, 2nd Edition, page 279
    k   := rand/127773;
    q   := 16807*(rand-k*127773)-2836*k;
    if q < 0 then
      q := q + 2147483647;
    end if;
    rand := init_rand(q);

    -- Convert this integer to a real number in the range 0 to 1
    real_rand := (real(rand - T_RANDINT'low)) / real(T_RANDINT'high - T_RANDINT'low);
    -- Convert this real number to an integer in the range minval to maxval
    -- The +1 and -0.5 are to get equal probability of minval and maxval as other values
    res    := integer((real_rand * real(maxval+1-minval)) - 0.5) + minval;
    -- VHDL real to integer conversion doesn't define what happens for x.5 so deal with this
    if res < minval then
      res  := minval;
    elsif res > maxval then
      res  := maxval;
    end if;
    -- assign output
    result := res;

  end rand_int;

      function esl_equal_std_lv (lv1 : STD_LOGIC_VECTOR; lv2 : STD_LOGIC_VECTOR) return BOOLEAN is
          variable len    : INTEGER;
          variable i      : INTEGER;
      begin
          if (lv1'length > lv2'length) then
              len := lv2'length;
              for i in lv1'length - 1 downto lv2'length loop
                  if(lv1(i) = '1') then
                      return false;
                  end if;
              end loop;
          else
              len := lv1'length;
              for i in lv2'length - 1 downto lv1'length loop
                  if(lv2(i) = '1') then
                      return false;
                  end if;
              end loop;
          end if;
          for i in len - 1 downto 0 loop
              if (lv1(i) = '1' and lv2(i) /= '1') or (lv1(i) = '0' and lv2(i) /= '0') then
                  return false;
              end if;
          end loop;
          return true;
      end function;

      procedure post_check (file fp1 : TEXT; file fp2 : TEXT) is
          variable    token_line1 :   LINE;
          variable    token_line2 :   LINE;
          variable    token1      :   STRING(1 to 176);
          variable    token2      :   STRING(1 to 176);
          variable    golden      :   STD_LOGIC_VECTOR(175 downto 0);
          variable    result      :   STD_LOGIC_VECTOR(175 downto 0);
          variable    l1          :   INTEGER;
          variable    l2          :   INTEGER;
      begin
          esl_read_token(fp1, token_line1, token1);
          esl_read_token(fp2, token_line2, token2);
          if(token1(1 to 13) /= "[[[runtime]]]" or token2(1 to 13) /= "[[[runtime]]]") then
              assert false report "ERROR: Simulation using HLS TB failed." severity failure;
          end if;
          esl_read_token(fp1, token_line1, token1);
          esl_read_token(fp2, token_line2, token2);
          while(token1(1 to 14) /= "[[[/runtime]]]" and token2(1 to 14) /= "[[[/runtime]]]") loop
              if(token1(1 to 15) /= "[[transaction]]" and token2(1 to 15) /= "[[transaction]]") then
                  assert false report "ERROR: Simulation using HLS TB failed." severity failure;
              end if;
              esl_read_token(fp1, token_line1, token1);  -- Skip transaction number
              esl_read_token(fp2, token_line2, token2);  -- Skip transaction number
              esl_read_token(fp1, token_line1, token1, l1);
              esl_read_token(fp2, token_line2, token2, l2);
              while(token1(1 to 16) /= "[[/transaction]]" and token2(1 to 16) /= "[[/transaction]]") loop
                  golden := esl_str2lv_hex(token1, 176 );
                  result := esl_str2lv_hex(token2, 176 );
                  if(esl_equal_std_lv(golden, result) = false) then
                      report token1(1 to l1) & " (expected) vs. " & token2(1 to l2) & " (actual) - mismatch";
                      assert false report "ERROR: Simulation using HLS TB failed." severity failure;
                  end if;
                  esl_read_token(fp1, token_line1, token1);
                  esl_read_token(fp2, token_line2, token2);
              end loop;
              esl_read_token(fp1, token_line1, token1);
              esl_read_token(fp2, token_line2, token2);
          end loop;
      end procedure post_check;

begin
AESL_inst_gravity    :   gravity port map (
   s_axi_CRTLS_AWADDR  =>  CRTLS_AWADDR,
   s_axi_CRTLS_AWVALID  =>  CRTLS_AWVALID,
   s_axi_CRTLS_AWREADY  =>  CRTLS_AWREADY,
   s_axi_CRTLS_WVALID  =>  CRTLS_WVALID,
   s_axi_CRTLS_WREADY  =>  CRTLS_WREADY,
   s_axi_CRTLS_WDATA  =>  CRTLS_WDATA,
   s_axi_CRTLS_WSTRB  =>  CRTLS_WSTRB,
   s_axi_CRTLS_ARADDR  =>  CRTLS_ARADDR,
   s_axi_CRTLS_ARVALID  =>  CRTLS_ARVALID,
   s_axi_CRTLS_ARREADY  =>  CRTLS_ARREADY,
   s_axi_CRTLS_RVALID  =>  CRTLS_RVALID,
   s_axi_CRTLS_RREADY  =>  CRTLS_RREADY,
   s_axi_CRTLS_RDATA  =>  CRTLS_RDATA,
   s_axi_CRTLS_RRESP  =>  CRTLS_RRESP,
   s_axi_CRTLS_BVALID  =>  CRTLS_BVALID,
   s_axi_CRTLS_BREADY  =>  CRTLS_BREADY,
   s_axi_CRTLS_BRESP  =>  CRTLS_BRESP,
   interrupt  =>  CRTLS_INTERRUPT,
   ap_local_block  =>  ap_local_block,
   ap_clk  =>  ap_clk,
   ap_rst_n  =>  ap_rst_n
);

-- Assignment for control signal
  ap_clk <= AESL_clock;
  ap_rst_n <= dut_rst;
  AESL_reset <= rst;
  AESL_start <= start;
  AESL_ce <= ce;
  AESL_continue <= continue;
  AESL_slave_write_start_in <= slave_start_status  and CRTLS_write_data_finish;
  AESL_slave_start <= AESL_slave_write_start_finish;
  AESL_done <= slave_done_status  and CRTLS_read_data_finish;

slave_start_proc : process(AESL_clock)
begin
  if (AESL_clock'event and AESL_clock = '1') then
    if(AESL_reset = '0') then
        slave_start_status <= '1';
    else
        if (AESL_start = '1' ) then
            start_rise <= '1';
        end if;
        if (start_rise = '1' and AESL_done = '1' ) then
            slave_start_status <= '1';
        end if;
        if (AESL_slave_write_start_in = '1' and AESL_done = '0') then 
            slave_start_status <= '0';
            start_rise <= '0';
        end if;
    end if;
  end if;
end process;

slave_ready_proc : process(AESL_clock)
begin
  if (AESL_clock'event and AESL_clock = '1') then
    if(AESL_reset = '0') then
        AESL_slave_ready <= '0';
        ready_rise <= '0';
    else
        if (AESL_ready = '1' ) then
            ready_rise <= '1';
        end if;
        if (ready_rise = '1' and AESL_done_delay = '1' ) then
            AESL_slave_ready <= '1';
        end if;
        if (AESL_slave_ready = '1') then 
            AESL_slave_ready <= '0';
            ready_rise <= '0';
        end if;
    end if;
  end if;
end process;

slave_done_proc : process(AESL_clock)
begin
  if (AESL_clock'event and AESL_clock = '1') then
    if (AESL_done = '1') then
        slave_done_status <= '0';
    elsif (AESL_slave_output_done = '1' ) then
        slave_done_status <= '1';
    end if;
  end if;
end process;
AESL_axi_slave_inst_CRTLS : AESL_AXI_SLAVE_CRTLS port map (
    clk   =>  AESL_clock,
    reset =>  AESL_reset,
    TRAN_s_axi_CRTLS_AWADDR => CRTLS_AWADDR,
    TRAN_s_axi_CRTLS_AWVALID => CRTLS_AWVALID,
    TRAN_s_axi_CRTLS_AWREADY => CRTLS_AWREADY,
    TRAN_s_axi_CRTLS_WVALID => CRTLS_WVALID,
    TRAN_s_axi_CRTLS_WREADY => CRTLS_WREADY,
    TRAN_s_axi_CRTLS_WDATA => CRTLS_WDATA,
    TRAN_s_axi_CRTLS_WSTRB => CRTLS_WSTRB,
    TRAN_s_axi_CRTLS_ARADDR => CRTLS_ARADDR,
    TRAN_s_axi_CRTLS_ARVALID => CRTLS_ARVALID,
    TRAN_s_axi_CRTLS_ARREADY => CRTLS_ARREADY,
    TRAN_s_axi_CRTLS_RVALID => CRTLS_RVALID,
    TRAN_s_axi_CRTLS_RREADY => CRTLS_RREADY,
    TRAN_s_axi_CRTLS_RDATA => CRTLS_RDATA,
    TRAN_s_axi_CRTLS_RRESP => CRTLS_RRESP,
    TRAN_s_axi_CRTLS_BVALID => CRTLS_BVALID,
    TRAN_s_axi_CRTLS_BREADY => CRTLS_BREADY,
    TRAN_s_axi_CRTLS_BRESP => CRTLS_BRESP,
    TRAN_CRTLS_interrupt => CRTLS_INTERRUPT,
    TRAN_CRTLS_read_data_finish => CRTLS_read_data_finish,
    TRAN_CRTLS_write_data_finish => CRTLS_write_data_finish,
    TRAN_CRTLS_ready_out => AESL_ready,
    TRAN_CRTLS_ready_in => AESL_slave_ready,
    TRAN_CRTLS_done_out => AESL_slave_output_done,
    TRAN_CRTLS_idle_out => AESL_idle,
    TRAN_CRTLS_write_start_in     => AESL_slave_write_start_in,
    TRAN_CRTLS_write_start_finish => AESL_slave_write_start_finish,
    TRAN_CRTLS_transaction_done_in => AESL_done_delay,
    TRAN_CRTLS_start_in  => AESL_slave_start
);

-- Write "[[[runtime]]]" and "[[[/runtime]]]" for output transactor 
write_output_transactor_ap_return_runtime_proc : process
  file        fp              :   TEXT;
  variable    fstatus         :   FILE_OPEN_STATUS;
  variable    token_line      :   LINE;
  variable    token           :   STRING(1 to 1024);
begin
    file_open(fstatus, fp, AUTOTB_TVOUT_ap_return_out_wrapc, WRITE_MODE);
    if(fstatus /= OPEN_OK) then
        assert false report "Open file " & AUTOTB_TVOUT_ap_return_out_wrapc & " failed!!!" severity note;
        assert false report "ERROR: Simulation using HLS TB failed." severity failure;
    end if;
    write(token_line, string'("[[[runtime]]]"));
    writeline(fp, token_line);
    file_close(fp);
    while done_cnt /= AUTOTB_TRANSACTION_NUM loop
        wait until AESL_clock'event and AESL_clock = '1';
    end loop;
    wait until AESL_clock'event and AESL_clock = '1';
    wait until AESL_clock'event and AESL_clock = '1';
    wait until AESL_clock'event and AESL_clock = '1';
    wait until AESL_clock'event and AESL_clock = '1';
    wait until AESL_clock'event and AESL_clock = '1';
    file_open(fstatus, fp, AUTOTB_TVOUT_ap_return_out_wrapc, APPEND_MODE);
    if(fstatus /= OPEN_OK) then
        assert false report "Open file " & AUTOTB_TVOUT_ap_return_out_wrapc & " failed!!!" severity note;
        assert false report "ERROR: Simulation using HLS TB failed." severity failure;
    end if;
    write(token_line, string'("[[[/runtime]]]"));
    writeline(fp, token_line);
    file_close(fp);
    wait;
end process;

generate_ready_cnt_proc : process(ready_initial, AESL_clock)
begin
    if(AESL_clock'event and AESL_clock = '0') then
        if(ready_initial = '1') then
            ready_cnt <= conv_std_logic_vector(1, 32);
        end if;
    elsif(AESL_clock'event and AESL_clock = '1') then
        if(ready_cnt /= AUTOTB_TRANSACTION_NUM) then
            if(AESL_ready = '1') then
                ready_cnt <= ready_cnt + 1;
            end if;
        end if;
    end if;
end process;

generate_done_cnt_proc : process(AESL_reset, AESL_clock)
begin
    if(AESL_reset = '0') then
        done_cnt <= (others => '0');
    elsif(AESL_clock'event and AESL_clock = '1') then
        if(done_cnt /= AUTOTB_TRANSACTION_NUM) then
            if(AESL_done = '1') then
                done_cnt <= done_cnt + 1;
            end if;
        end if;
    end if;
end process;

generate_sim_done_proc    :   process
    file      fp1         :   TEXT;
    file      fp2         :   TEXT;
    variable  fstatus1    :   FILE_OPEN_STATUS;
    variable  fstatus2    :   FILE_OPEN_STATUS;
begin
    while(done_cnt /= AUTOTB_TRANSACTION_NUM) loop
        wait until AESL_clock'event and AESL_clock = '1';
    end loop;
        wait until AESL_clock'event and AESL_clock = '1';
        wait until AESL_clock'event and AESL_clock = '1';
        wait until AESL_clock'event and AESL_clock = '1';
        wait until AESL_clock'event and AESL_clock = '1';
        wait until AESL_clock'event and AESL_clock = '1';
        wait until AESL_clock'event and AESL_clock = '1';
    file_open(fstatus1, fp1, "./rtl.gravity.autotvout_ap_return.dat", READ_MODE);
    file_open(fstatus2, fp2, "./impl_rtl.gravity.autotvout_ap_return.dat", READ_MODE);
    if(fstatus1 /= OPEN_OK) then
        assert false report string'("Open file rtl.gravity.autotvout_ap_return.dat failed!!!") severity note;
    elsif(fstatus2 /= OPEN_OK) then
        assert false report string'("Open file impl_rtl.gravity.autotvout_ap_return.dat failed!!!") severity note;
    else
        report string'("Comparing rtl.gravity.autotvout_ap_return.dat with impl_rtl.gravity.autotvout_ap_return.dat");
        post_check(fp1, fp2);
    end if;
    file_close(fp1);
    file_close(fp2);
    report "Simulation Passed.";
    assert false report "simulation done!" severity note;
    assert false report "NORMAL EXIT (note: failure is to force the simulator to stop)" severity failure;
    wait;
end process;

gen_clock_proc :   process
begin
    AESL_clock <= '0';
    while(true) loop
        wait for AUTOTB_CLOCK_PERIOD_DIV2;
        AESL_clock <= not AESL_clock;
    end loop;
    wait;
end process;

gen_reset_proc : process
    variable  rand            :   T_RANDINT     := init_rand(0);
    variable  rint            :   INTEGER;
begin
    rst <= '0';
    wait for 100 ns;
    for i in 1 to (3+0) loop
        wait until AESL_clock'event and AESL_clock = '1';
    end loop;
    rst <= '1';
    wait;
end process;

gen_dut_reset_proc : process
    variable  rand            :   T_RANDINT     := init_rand(0);
    variable  rint            :   INTEGER;
begin
    dut_rst <= '0';
    wait for 100 ns;
    for i in 1 to 3 loop
        wait until AESL_clock'event and AESL_clock = '1';
    end loop;
    dut_rst <= '1';
    wait;
end process;

gen_start_proc : process
    variable  rand            :   T_RANDINT     := init_rand(0);
    variable  rint            :   INTEGER;
begin
  start <= '0';
  ce <= '1';
    wait until AESL_reset = '1';
  wait until (AESL_clock'event and AESL_clock = '1');
  start <= '1';
  while(ready_cnt /= AUTOTB_TRANSACTION_NUM) loop
      wait until (AESL_clock'event and AESL_clock = '1');
      if(AESL_ready = '1') then
          start <= '0';
          start <= '1';
      end if;
  end loop;
  while (start = '1') loop
      if(AESL_ready = '1') then
          start <= '0';
      end if;
      wait until (AESL_clock'event and AESL_clock = '1');
  end loop;
  wait;
end process;


gen_continue_proc : process(AESL_done)
begin
    continue <= AESL_done;
end process;

gen_AESL_ready_delay_proc : process(AESL_clock)
begin
  if (AESL_clock'event and AESL_clock = '1') then
    if(AESL_reset = '0') then
          AESL_ready_delay <= '0';
      else
          AESL_ready_delay <= AESL_ready;
      end if;
  end if;
end process;

gen_ready_initial_proc : process
begin
    ready_initial <= '0';
    wait until AESL_start = '1';
    ready_initial <= '1';
    wait until AESL_clock'event and AESL_clock = '1';
    ready_initial <= '0';
    wait;
end process;

ready_last_n_proc : process
begin
  ready_last_n <= '1';
  while(ready_cnt /= AUTOTB_TRANSACTION_NUM) loop
    wait until AESL_clock'event and AESL_clock = '1';
  end loop;
  ready_last_n <= '0';
  wait;
end process;

gen_ready_delay_n_last_proc : process(AESL_clock)
begin
  if (AESL_clock'event and AESL_clock = '1') then
    if(AESL_reset = '0') then
          ready_delay_last_n <= '0';
      else
          ready_delay_last_n <= ready_last_n;
      end if;
  end if;
end process;

ready <= (ready_initial or AESL_ready_delay);
ready_wire <= ready_initial or AESL_ready_delay;
done_delay_last_n <= '0' when done_cnt = AUTOTB_TRANSACTION_NUM else '1';

gen_done_delay_proc : process(AESL_clock)
begin
  if (AESL_clock'event and AESL_clock = '1') then
    if(AESL_reset = '0') then
          AESL_done_delay <= '0';
          AESL_done_delay2 <= '0';
      else
          AESL_done_delay <= AESL_done and done_delay_last_n;
          AESL_done_delay2 <= AESL_done_delay;
      end if;
  end if;
end process;

gen_interface_done : process(done_cnt, AESL_ready_delay, AESL_done_delay)
begin
    if(done_cnt < AUTOTB_TRANSACTION_NUM) then
        interface_done <= AESL_ready_delay;
    else
        interface_done <= AESL_done_delay;
    end if;
end process;
gen_clock_counter_proc : process(AESL_clock)
begin
  if (AESL_clock'event and AESL_clock = '1') then
    if(AESL_reset = '0') then
        AESL_clk_counter <= 0;
        AESL_start_p1 <= '0';
        AESL_ready_p1 <= '0';
    else
        AESL_clk_counter <= AESL_clk_counter + 1;
        AESL_start_p1 <= AESL_start;
        AESL_ready_p1 <= AESL_ready;
    end if;
  end if;
end process;

gen_mLatcnterout_proc : process(AESL_clock)
begin
  if (AESL_clock'event and AESL_clock = '1') then
    if(AESL_reset = '0') then
          AESL_mLatCnterOut_addr := 0;
          AESL_mLatCnterOut(AESL_mLatCnterOut_addr) := AESL_clk_counter + 1 ;
          reported_stuck_cnt := 0;
      else
          if (AESL_done = '1' and AESL_mLatCnterOut_addr < AUTOTB_TRANSACTION_NUM + 1) then
              AESL_mLatCnterOut(AESL_mLatCnterOut_addr) := AESL_clk_counter;
              AESL_mLatCnterOut_addr := AESL_mLatCnterOut_addr + 1;
              reported_stuck <= '0';
          end if;
      end if;
  end if;
end process;

gen_mLatcnterin_proc : process(AESL_clock)
begin
  if (AESL_clock'event and AESL_clock = '1') then
    if(AESL_reset = '0') then
        AESL_mLatCnterIn_addr := 0;
      else
        if (AESL_mLatCnterIn_addr < AUTOTB_TRANSACTION_NUM) then
          if (AESL_start = '1' and AESL_start_p1 = '0') then
            AESL_mLatCnterIn(AESL_mLatCnterIn_addr) := AESL_clk_counter;
            AESL_mLatCnterIn_addr := AESL_mLatCnterIn_addr + 1;
          elsif (AESL_start = '1' and AESL_ready_p1 = '1') then
            AESL_mLatCnterIn(AESL_mLatCnterIn_addr) := AESL_clk_counter;
            AESL_mLatCnterIn_addr := AESL_mLatCnterIn_addr + 1;
          end if;
        end if;
      end if;
  end if;
end process;

gen_mThrCnterrIn_proc : process(AESL_clock)
begin
  if (AESL_clock'event and AESL_clock = '1') then
    if(AESL_reset = '0') then
        AESL_mThrCnterIn_addr := 0;
    else
      if (AESL_mThrCnterIn_addr < AUTOTB_TRANSACTION_NUM) then
        if (AESL_start_p1 = '1' and AESL_ready_p1 = '1') then
          AESL_mThrCnterIn(AESL_mThrCnterIn_addr) := AESL_clk_counter;
          AESL_mThrCnterIn_addr := AESL_mThrCnterIn_addr + 1;
        end if;
      end if;
    end if;
  end if;
end process;

gen_performance_check_proc : process
    variable transaction_counter : INTEGER;
    variable i : INTEGER;
    file     fp :   TEXT;
    variable    fstatus         :   FILE_OPEN_STATUS;
    variable    token_line      :   LINE;
    variable    token           :   STRING(1 to 1024);

    variable latthistime : INTEGER;
    variable lattotal : INTEGER;
    variable latmax : INTEGER;
    variable latmin : INTEGER;


    variable thrthistime : INTEGER;
    variable thrtotal : INTEGER;
    variable thrmax : INTEGER;
    variable thrmin : INTEGER;

    variable lataver : INTEGER;
    variable thraver : INTEGER;
    variable total_execute_time : INTEGER;
    type latency_record is array(0 to AUTOTB_TRANSACTION_NUM + 1) of INTEGER;
    variable lat_array : latency_record;
    variable thr_array : latency_record;

begin
    i := 0;
    lattotal  := 0;
    latmax    := 0;
    latmin    := 16#7fffffff#;
    lataver   := 0;

    thrtotal  := 0;
    thrmax    := 0;
    thrmin    := 16#7fffffff#;
    thraver   := 0;

    wait until (AESL_clock'event and AESL_clock = '1');
    wait until (AESL_reset = '1'); 
    while (done_cnt /= AUTOTB_TRANSACTION_NUM) loop
        wait until (AESL_clock'event and AESL_clock = '1');
    end loop;
  wait for 0.001 ns;

    for i in 0 to AUTOTB_TRANSACTION_NUM - 1 loop
        latthistime := AESL_mLatCnterOut(i) - AESL_mLatCnterIn(i);
        lat_array(i) := latthistime;
        if (latthistime > latmax) then
            latmax := latthistime; 
        end if;
        if (latthistime < latmin) then
            latmin := latthistime;
        end if;
		lattotal := lattotal + latthistime;
	end loop;
	lataver := lattotal / AUTOTB_TRANSACTION_NUM;
  if (AUTOTB_TRANSACTION_NUM = 1) then
	  thrthistime := 0;
    thrmin := 0;
    thrmax := 0;
    thrtotal := 0;
    thraver := 0;
	else
    for i in 0 to AUTOTB_TRANSACTION_NUM - 2 loop
      thrthistime := AESL_mLatCnterIn(i + 1) - AESL_mLatCnterIn(i);
      thr_array(i) := thrthistime;
		if (thrthistime > thrmax) then
		    thrmax := thrthistime;
      end if;
		if (thrthistime < thrmin) then
	        thrmin := thrthistime;
      end if;
		thrtotal := thrtotal + thrthistime;
	  end loop;
	  thraver := thrtotal / (AUTOTB_TRANSACTION_NUM - 1);
	end if;
  total_execute_time := lat_total;


    file_open(fstatus, fp, AUTOTB_LAT_RESULT_FILE, WRITE_MODE);
    if (fstatus /= OPEN_OK) then
        assert false report "Open file " & AUTOTB_LAT_RESULT_FILE & " failed!!!" severity note;
        assert false report "ERROR: Simulation using HLS TB failed." severity failure;
    else
        write(token_line, "$MAX_LATENCY = " & '"' & integer'image(latmax) & '"');
        writeline(fp, token_line);
        write(token_line, "$MIN_LATENCY = " & '"' & integer'image(latmin) & '"');
        writeline(fp, token_line);
        write(token_line, "$AVER_LATENCY = " & '"' & integer'image(lataver) & '"');
        writeline(fp, token_line);
        write(token_line, "$MAX_THROUGHPUT = " & '"' & integer'image(thrmax) & '"');
        writeline(fp, token_line);
        write(token_line, "$MIN_THROUGHPUT = " & '"' & integer'image(thrmin) & '"');
        writeline(fp, token_line);
        write(token_line, "$AVER_THROUGHPUT = " & '"' & integer'image(thraver) & '"');
        writeline(fp, token_line);
        write(token_line, "$TOTAL_EXECUTE_TIME = " & '"' & integer'image(total_execute_time) & '"');
        writeline(fp, token_line);
    end if;

    file_close(fp);

    file_open(fstatus, fp, AUTOTB_PER_RESULT_TRANS_FILE, WRITE_MODE);
    if(fstatus /= OPEN_OK) then
        assert false report "Open file " & AUTOTB_PER_RESULT_TRANS_FILE & " failed!!!" severity note;
        assert false report "ERROR: Simulation using HLS TB failed." severity failure;
    end if;

    write(token_line,string'("                            latency            interval"));
    writeline(fp, token_line);
    if (AUTOTB_TRANSACTION_NUM = 1) then
        i := 0;
        thr_array(i) := 0;
        write(token_line,"transaction        " & integer'image(i) & "            " & integer'image(lat_array(i) ) & "            " & integer'image(thr_array(i) ) );
        writeline(fp, token_line);
    else
        for i in 0 to AUTOTB_TRANSACTION_NUM - 1 loop
            write(token_line,"transaction        " & integer'image(i) & "            " & integer'image(lat_array(i) ) & "            " & integer'image(thr_array(i) ) );
            writeline(fp, token_line);
        end loop;
    end if;
    file_close(fp);
    wait;
end process;

calc_lat_total : process(AESL_clock)
begin
    if (AESL_clock'event and AESL_clock = '1') then
        if (done_cnt = AUTOTB_TRANSACTION_NUM - 1 and AESL_done = '1') then
            lat_total <= AESL_clk_counter - AESL_mLatCnterIn(0);
        end if;
    end if;
end process;
end behav;
