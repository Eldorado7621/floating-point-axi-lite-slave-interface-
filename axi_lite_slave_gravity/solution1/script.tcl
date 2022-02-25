############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project axi_lite_slave_gravity
set_top gravity
add_files core.cpp
add_files -tb test_core.cpp
add_files -tb test_core.h
open_solution "solution1" -flow_target vivado
set_part {xc7z010clg400-1}
create_clock -period 10 -name default
config_export -output /home/sam/git_workspace/floating-point-axi-lite-slave-interface-
#source "./axi_lite_slave_gravity/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -trace_level all -rtl vhdl
export_design -rtl verilog -format ip_catalog -output /home/sam/git_workspace/floating-point-axi-lite-slave-interface-
