run:
	iverilog -g2012 -o edge_sim edge_detector.sv edge_detector_tb.sv
	vvp edge_sim

clean:
	rm -f edge_sim waves.vcd