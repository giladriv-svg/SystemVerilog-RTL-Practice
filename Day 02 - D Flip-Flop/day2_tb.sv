module day2_tb;

    // ==========================================
    // 1. Signal Declaration
    // ==========================================
    logic clk;
    logic rst;
    logic d_i;
    logic q_norst;
    logic q_syncrst;
    logic q_asyncrst;

    // ==========================================
    // 2. DUT Instantiation
    // ==========================================
    day2_dff dut (
        .clk(clk),
        .rst(rst),
        .d_i(d_i),
        .q_norst_o(q_norst),
        .q_syncrst_o(q_syncrst),
        .q_asyncrst_o(q_asyncrst)
    );

    // ==========================================
    // 3. Clock Generation
    // ==========================================
    
    always #5 clk = ~clk; // 10 time units clock period
    initial clk = 0;

    // ==========================================
    // 4. Stimulus (The Movie Script)
    // ==========================================
    initial begin
        $dumpfile("waves.vcd");
        $dumpvars;
        $monitor("Time=%0t | rst=%b | d=%b | q_no=%b | q_sync=%b | q_async=%b", 
                 $time, rst, d_i, q_norst, q_syncrst, q_asyncrst);

        
         rst = 1;
         d_i = 0;
        

        // --- Step B: Release Reset ---
        #10;
        rst = 0; 

        // --- Step C: Standard Operation ---
        d_i = 1;
        #10;
        d_i = 0;
        #10;
        d_i = 1;
        #10;
        

        // --- Step D: Test Asynchronous Reset ---
        // We want to see if the Async DFF resets IMMEDIATELY,
        // even if the clock hasn't risen yet.
        
        #7;
        rst = 1;
        #2;
        rst = 0;

        #20;
        $finish;
    end

endmodule