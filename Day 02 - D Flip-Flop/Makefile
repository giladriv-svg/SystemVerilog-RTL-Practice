run:
	iverilog -g2012 -o dff_sim day2_dff.sv day2_tb.sv
	vvp dff_sim

clean:
	rm -f dff_sim waves.vcd