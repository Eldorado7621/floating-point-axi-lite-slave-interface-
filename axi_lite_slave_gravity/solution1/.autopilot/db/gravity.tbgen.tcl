set moduleName gravity
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {gravity}
set C_modelType { float 32 }
set C_modelArgList {
	{ m1 float 32 regular {axi_slave 0}  }
	{ m2 float 32 regular {axi_slave 0}  }
	{ distc float 32 regular {axi_slave 0}  }
	{ ap_local_deadlock int 1 unused {axi_slave 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m1", "interface" : "axi_slave", "bundle":"CRTLS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "m2", "interface" : "axi_slave", "bundle":"CRTLS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "distc", "interface" : "axi_slave", "bundle":"CRTLS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "ap_local_deadlock", "interface" : "axi_slave", "bundle":"CRTLS","type":"ap_none","bitwidth" : 1, "direction" : "WRITEONLY", "offset" : {"out":0}, "offset_end" : {"out":4294967295}} , 
 	{ "Name" : "ap_return", "interface" : "axi_slave", "bundle":"CRTLS","type":"ap_none","bitwidth" : 32, "offset" : {"out":16}} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_local_block sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axi_CRTLS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CRTLS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CRTLS_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_CRTLS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CRTLS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CRTLS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_CRTLS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_CRTLS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CRTLS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CRTLS_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_CRTLS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CRTLS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CRTLS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_CRTLS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_CRTLS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CRTLS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CRTLS_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_CRTLS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "CRTLS", "role": "AWADDR" },"address":[{"name":"gravity","role":"start","value":"0","valid_bit":"0"},{"name":"gravity","role":"continue","value":"0","valid_bit":"4"},{"name":"gravity","role":"auto_start","value":"0","valid_bit":"7"},{"name":"m1","role":"data","value":"24"},{"name":"m2","role":"data","value":"32"},{"name":"distc","role":"data","value":"40"}] },
	{ "name": "s_axi_CRTLS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "AWVALID" } },
	{ "name": "s_axi_CRTLS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "AWREADY" } },
	{ "name": "s_axi_CRTLS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "WVALID" } },
	{ "name": "s_axi_CRTLS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "WREADY" } },
	{ "name": "s_axi_CRTLS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CRTLS", "role": "WDATA" } },
	{ "name": "s_axi_CRTLS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CRTLS", "role": "WSTRB" } },
	{ "name": "s_axi_CRTLS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "CRTLS", "role": "ARADDR" },"address":[{"name":"gravity","role":"start","value":"0","valid_bit":"0"},{"name":"gravity","role":"done","value":"0","valid_bit":"1"},{"name":"gravity","role":"idle","value":"0","valid_bit":"2"},{"name":"gravity","role":"ready","value":"0","valid_bit":"3"},{"name":"gravity","role":"auto_start","value":"0","valid_bit":"7"},{"name":"return","role":"data","value":"16"},{"name":"ap_local_deadlock","role":"data","value":"0"}] },
	{ "name": "s_axi_CRTLS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "ARVALID" } },
	{ "name": "s_axi_CRTLS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "ARREADY" } },
	{ "name": "s_axi_CRTLS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "RVALID" } },
	{ "name": "s_axi_CRTLS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "RREADY" } },
	{ "name": "s_axi_CRTLS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CRTLS", "role": "RDATA" } },
	{ "name": "s_axi_CRTLS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CRTLS", "role": "RRESP" } },
	{ "name": "s_axi_CRTLS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "BVALID" } },
	{ "name": "s_axi_CRTLS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "BREADY" } },
	{ "name": "s_axi_CRTLS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CRTLS", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CRTLS", "role": "interrupt" } }, 
 	{ "name": "ap_local_block", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_block", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "gravity",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "23", "EstimateLatencyMax" : "23",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "m1", "Type" : "None", "Direction" : "I"},
			{"Name" : "m2", "Type" : "None", "Direction" : "I"},
			{"Name" : "distc", "Type" : "None", "Direction" : "I"},
			{"Name" : "ap_local_deadlock", "Type" : "None", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.CRTLS_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U1", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U2", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_16_no_dsp_1_U3", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U4", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	gravity {
		m1 {Type I LastRead 0 FirstWrite -1}
		m2 {Type I LastRead 0 FirstWrite -1}
		distc {Type I LastRead 0 FirstWrite -1}
		ap_local_deadlock {Type O LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "23", "Max" : "23"}
	, {"Name" : "Interval", "Min" : "24", "Max" : "24"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
