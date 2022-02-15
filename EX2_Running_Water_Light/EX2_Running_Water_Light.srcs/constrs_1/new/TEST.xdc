set_property PACKAGE_PIN T12 [get_ports {LED[1]}]
set_property PACKAGE_PIN U12 [get_ports {LED[3]}]
set_property PACKAGE_PIN V12 [get_ports {LED[5]}]
set_property PACKAGE_PIN W13 [get_ports {LED[7]}]
set_property PACKAGE_PIN M20 [get_ports rstn]
set_property PACKAGE_PIN K17 [get_ports clk]
set_property DRIVE 12 [get_ports {LED[2]}]

create_clock -period 40.000 -name clk -waveform {0.000 20.000} [get_ports clk]
create_generated_clock -name {PWM/levels_reg[0]} -source [get_ports clk] -divide_by 1 [get_pins {PWM/levels_reg[0]/Q}]
create_generated_clock -name {PWM/levels_reg[1]} -source [get_ports clk] -divide_by 1 [get_pins {PWM/levels_reg[1]/Q}]
create_generated_clock -name {PWM/levels_reg[2]} -source [get_ports clk] -divide_by 1 [get_pins {PWM/levels_reg[2]/Q}]
create_generated_clock -name {PWM/levels_reg[3]} -source [get_ports clk] -divide_by 1 [get_pins {PWM/levels_reg[3]/Q}]
create_generated_clock -name {PWM/levels_reg[4]} -source [get_ports clk] -divide_by 1 [get_pins {PWM/levels_reg[4]/Q}]
create_generated_clock -name {PWM/levels_reg[5]} -source [get_ports clk] -divide_by 1 [get_pins {PWM/levels_reg[5]/Q}]
create_generated_clock -name {PWM/levels_reg[6]} -source [get_ports clk] -divide_by 1 [get_pins {PWM/levels_reg[6]/Q}]
create_generated_clock -name {PWM/levels_reg[7]} -source [get_ports clk] -divide_by 1 [get_pins {PWM/levels_reg[7]/Q}]
create_generated_clock -name {PWM/levels_reg[8]} -source [get_ports clk] -divide_by 1 [get_pins {PWM/levels_reg[8]/Q}]
create_generated_clock -name {PWM/levels_reg[9]} -source [get_ports clk] -divide_by 1 [get_pins {PWM/levels_reg[9]/Q}]
create_generated_clock -name {flowclock_generater/counter[0]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[0]/Q}]
create_generated_clock -name {flowclock_generater/counter[1]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[1]/Q}]
create_generated_clock -name {flowclock_generater/counter[2]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[2]/Q}]
create_generated_clock -name {flowclock_generater/counter[3]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[3]/Q}]
create_generated_clock -name {flowclock_generater/counter[4]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[4]/Q}]
create_generated_clock -name {flowclock_generater/counter[5]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[5]/Q}]
create_generated_clock -name {flowclock_generater/counter[6]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[6]/Q}]
create_generated_clock -name {flowclock_generater/counter[7]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[7]/Q}]
create_generated_clock -name {flowclock_generater/counter[8]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[8]/Q}]
create_generated_clock -name {flowclock_generater/counter[9]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[9]/Q}]
create_generated_clock -name {flowclock_generater/counter[10]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[10]/Q}]
create_generated_clock -name {flowclock_generater/counter[11]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[11]/Q}]
create_generated_clock -name {flowclock_generater/counter[12]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[12]/Q}]
create_generated_clock -name {flowclock_generater/counter[13]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[13]/Q}]
create_generated_clock -name {flowclock_generater/counter[14]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[14]/Q}]
create_generated_clock -name {flowclock_generater/counter[15]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[15]/Q}]
create_generated_clock -name {flowclock_generater/counter[16]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[16]/Q}]
create_generated_clock -name {flowclock_generater/counter[17]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[17]/Q}]
create_generated_clock -name {flowclock_generater/counter[18]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[18]/Q}]
create_generated_clock -name {flowclock_generater/counter[19]} -source [get_ports clk] -divide_by 1 [get_pins {flowclock_generater/counter_reg[19]/Q}]
set_input_delay -clock [get_clocks clk] -min -add_delay 80.000 [get_ports rstn]
set_input_delay -clock [get_clocks clk] -max -add_delay 100.000 [get_ports rstn]

set_property PACKAGE_PIN R18 [get_ports {LED[6]}]
set_property PACKAGE_PIN P18 [get_ports {LED[4]}]
set_property PACKAGE_PIN P19 [get_ports {LED[2]}]
set_property PACKAGE_PIN N18 [get_ports {LED[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports rstn]
set_property SLEW SLOW [get_ports {LED[7]}]
set_property SLEW SLOW [get_ports {LED[6]}]
set_property SLEW SLOW [get_ports {LED[5]}]
set_property SLEW SLOW [get_ports {LED[4]}]
set_property SLEW SLOW [get_ports {LED[3]}]
set_property SLEW SLOW [get_ports {LED[2]}]
set_property SLEW SLOW [get_ports {LED[1]}]
set_property SLEW SLOW [get_ports {LED[0]}]

set_property DRIVE 12 [get_ports {LED[7]}]
set_property DRIVE 12 [get_ports {LED[6]}]
set_property DRIVE 12 [get_ports {LED[5]}]
set_property DRIVE 12 [get_ports {LED[4]}]
set_property DRIVE 12 [get_ports {LED[3]}]
set_property DRIVE 12 [get_ports {LED[1]}]
set_property DRIVE 12 [get_ports {LED[0]}]


