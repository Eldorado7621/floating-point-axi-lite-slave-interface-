# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/sam/git_workspace/floating-point-axi-lite-slave-interface-/gravity_pp/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/sam/git_workspace/floating-point-axi-lite-slave-interface-/gravity_pp/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {gravity_pp}\
-hw {/home/sam/git_workspace/floating-point-axi-lite-slave-interface-/axilite_slave_fgravity/design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/home/sam/git_workspace/floating-point-axi-lite-slave-interface-}

platform write
platform generate -domains 
platform active {gravity_pp}
platform generate
bsp reload
platform clean
platform generate
