transcript on

# Create and map work library
vlib work
vmap work work

# Compile only your testbench (UVM is already precompiled in Questa)
vlog -sv +acc=rn tb_top.sv

# Elaborate and run without -novopt
vsim -c work.tb_top \
     +UVM_TESTNAME=my_test \
     +UVM_VERBOSITY=UVM_LOW \
     -sv_seed random

run -all
quit

