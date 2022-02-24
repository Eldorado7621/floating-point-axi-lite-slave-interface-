create_project prj -part xc7z010-clg400-1 -force
set_property target_language vhdl [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/vhdl"
source "/home/sam/git_workspace/floating-point-axi-lite-slave-interface-/axi_lite_slave_gravity/solution1/syn/vhdl/gravity_fmul_32ns_32ns_32_4_max_dsp_1_ip.tcl"
source "/home/sam/git_workspace/floating-point-axi-lite-slave-interface-/axi_lite_slave_gravity/solution1/syn/vhdl/gravity_fdiv_32ns_32ns_32_16_no_dsp_1_ip.tcl"
source "/home/sam/git_workspace/floating-point-axi-lite-slave-interface-/axi_lite_slave_gravity/solution1/syn/vhdl/gravity_fcmp_32ns_32ns_1_2_no_dsp_1_ip.tcl"
