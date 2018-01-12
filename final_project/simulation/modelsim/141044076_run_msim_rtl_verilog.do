transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/X550J/Desktop/=D/Bilgisayar\ Organizasyonu/final_project {C:/Users/X550J/Desktop/=D/Bilgisayar Organizasyonu/final_project/mips_core.v}
vlog -vlog01compat -work work +incdir+C:/Users/X550J/Desktop/=D/Bilgisayar\ Organizasyonu/final_project {C:/Users/X550J/Desktop/=D/Bilgisayar Organizasyonu/final_project/mips_control_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/X550J/Desktop/=D/Bilgisayar\ Organizasyonu/final_project {C:/Users/X550J/Desktop/=D/Bilgisayar Organizasyonu/final_project/mips_alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/X550J/Desktop/=D/Bilgisayar\ Organizasyonu/final_project {C:/Users/X550J/Desktop/=D/Bilgisayar Organizasyonu/final_project/mips_registers.v}
vlog -vlog01compat -work work +incdir+C:/Users/X550J/Desktop/=D/Bilgisayar\ Organizasyonu/final_project {C:/Users/X550J/Desktop/=D/Bilgisayar Organizasyonu/final_project/mips_instr_mem.v}
vlog -vlog01compat -work work +incdir+C:/Users/X550J/Desktop/=D/Bilgisayar\ Organizasyonu/final_project {C:/Users/X550J/Desktop/=D/Bilgisayar Organizasyonu/final_project/mips_data_mem.v}

