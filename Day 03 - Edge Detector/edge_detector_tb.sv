module edge_detector_tb 
;

    // ==========================================
    // 1. Signal Declaration
    // ==========================================
    logic tb_clk;
    logic tb_rst;
    logic tb_signal;      
    logic tb_rising;      
    logic tb_falling;    

edge_detector dut (
        .clk(tb_clk),
        .rst(tb_rst),
        .signal_i(tb_signal),
        .rising_edge_o(tb_rising),
        .falling_edge_o(tb_falling)
    );

    always #5 tb_clk = ~tb_clk; 
    
    initial begin 
        $dumpfile("waves.vcd");
        $dumpvars;
        $monitor("Time=%0t | Clk=%b | Rst=%b | Signal=%b | (Prev=%b) | Rising=%b | Falling=%b", 
                 $time, tb_clk, tb_rst, tb_signal, dut.d_i, tb_rising, tb_falling);
                 
        tb_clk = 0 ;
        tb_rst = 1 ;
        tb_signal = 0 ;

        #20;

        @(negedge tb_clk);
        tb_signal = 1 ;
        @(negedge tb_clk);
        tb_signal = 0 ;

        @(negedge tb_clk);
        tb_rst = 0 ;
        repeat(3) @(negedge tb_clk);
        tb_signal = 1 ;
        repeat(3) @(negedge tb_clk);
        tb_signal = 0 ;
        repeat(2) @(negedge tb_clk);

        tb_signal = 1 ;
        @(negedge tb_clk);
        tb_signal = 0 ;
        repeat(5) @(negedge tb_clk);

        $finish ;
    end


endmodule
   

