run:
	iverilog -g2012 -o mux_sim day1_mux.sv day1_tb.sv
	vvp mux_sim

clean:
	rm -f mux_sim waves.vcd