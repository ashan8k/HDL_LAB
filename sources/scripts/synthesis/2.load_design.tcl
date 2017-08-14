if [file exists results] {
  file delete -force results
}
file mkdir results
set_vsdc results/design.vsdc
set_svf  results/design.svf

if [file exists WORK] {
  file delete -force WORK
}
file mkdir WORK
define_design_lib WORK -path ./WORK

lappend search_path ../src/

#analyze -library WORK -format sv $FILE_LIST
# By Ashan
analyze -library WORK -format sv $FILE_LIST
# elaborate design:
elaborate ${TOP_LEVEL_MODULE} -architecture verilog -library WORK

set_fix_multiple_port_nets -all -buffer_constants


