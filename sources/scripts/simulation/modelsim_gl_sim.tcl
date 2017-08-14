#########################################################################
#################      Gate Level Simulation Script         #############
#########################################################################
##### Integrated Electronic Systems Lab                    ##############
##### TU Darmstadt                                         ##############
#########################################################################


# Create a library for standard cells and fill it(only needed once)
vlib tsmc40
vlib work
vlog -work tsmc40 /cad/synopsys/libs/TSMC_40nm/digital/Front_End/verilog/tcbn45gsbwp12t_200a/tcbn45gsbwp12t.v

# Compile the gate level netlist, memory compiler and testbench into the library work
#vlog -work work ../designs/netlist/cpu_gl.v ../sources/testbench/memory.sv ../sources/testbench/testbench.sv
vlog -work work ../../../designs/cpu_gl.v ../../testbench/tb_cpu.sv 
# ../../testbench/memory.sv
# Perform the simulation with timing information annotated from the sdf file
#vsim -L tsmc40 -sdftyp /top_i=../sources/designs/mapped/cpu_timing.sdf -novopt work.testbench

vsim -L tsmc40 -sdftyp /cpu_i=../../../designs/cpu_timing.sdf -novopt work.tb_cpu
