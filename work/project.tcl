set projDir "D:/Programs/Alchitry/Alchitry-labs/Workspace/ALU_test/work/planAhead"
set projName "ALU_test"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Programs/Alchitry/Alchitry-labs/Workspace/ALU_test/work/verilog/mojo_top_0.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/ALU_test/work/verilog/alu_1.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/ALU_test/work/verilog/reset_conditioner_2.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/ALU_test/work/verilog/adder_3.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/ALU_test/work/verilog/bool_4.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/ALU_test/work/verilog/shft_5.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/ALU_test/work/verilog/comp_6.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/ALU_test/work/verilog/nv_7.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "D:/Programs/Alchitry/Alchitry-labs/Workspace/ALU_test/constraint/custom.ucf" "D:/Programs/Alchitry/Alchitry-labs/library/components/mojo.ucf" "D:/Programs/Alchitry/Alchitry-labs/library/components/io_shield.ucf" ]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
