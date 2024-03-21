transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Assignment3.vo}

vlog -vlog01compat -work work +incdir+C:/Users/hw/Desktop/Quartus_File/Assignment3 {C:/Users/hw/Desktop/Quartus_File/Assignment3/Controller_tb.v}

vsim -t 1ps -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  Controller_tb

add wave *
view structure
view signals
run -all
