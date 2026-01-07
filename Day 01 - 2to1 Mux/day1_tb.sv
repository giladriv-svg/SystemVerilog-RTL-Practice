module day1_tb;

    logic [7:0] a_itest;
    logic [7:0] b_itest;
    logic       sel_itest;
    logic [7:0] y_otest;


   day1_mux dut (
        .a_i(a_itest),
        .b_i(b_itest),
        .sel_i(sel_itest),
        .y_o(y_otest)
    );

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars;
        // Test case 1
        a_itest = 8'hFF; 
        b_itest = 8'h00;
        sel_itest = 0;
        #10;
        if (y_otest !== b_itest) begin
            $error("Test Failed! sel=0. Expected %h, Got %h", b_itest, y_otest);
        end else begin
            $display("Test Passed! sel=0 works.");
        end
        // Test case 2
        sel_itest = 1;
        #10;
        if (y_otest !== a_itest) begin
            $error("Test Failed! sel=1. Expected %h, Got %h", a_itest, y_otest);
        end else begin
            $display("Test Passed! sel=1 works.");
        end
        $finish;

    end

endmodule