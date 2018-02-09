onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_SingleCycle/CPU/clk
add wave -noupdate /tb_SingleCycle/CPU/IF_Instruction
add wave -noupdate /tb_SingleCycle/CPU/ID_RN1
add wave -noupdate /tb_SingleCycle/CPU/ID_RN2
add wave -noupdate /tb_SingleCycle/CPU/ID_RD1
add wave -noupdate /tb_SingleCycle/CPU/ID_RD2
add wave -noupdate /tb_SingleCycle/CPU/EX_ALUData2
add wave -noupdate /tb_SingleCycle/CPU/EX_ALUResult
add wave -noupdate /tb_SingleCycle/CPU/EX_Result
add wave -noupdate /tb_SingleCycle/CPU/EXMEM_MemRead
add wave -noupdate /tb_SingleCycle/CPU/EXMEM_MemWrite
add wave -noupdate /tb_SingleCycle/CPU/MEM_RD
add wave -noupdate /tb_SingleCycle/CPU/WB_WD
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 240
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {59 ns}
