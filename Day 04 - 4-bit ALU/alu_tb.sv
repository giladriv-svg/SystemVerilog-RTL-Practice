module tb_alu;

    logic [7:0] a_i;
    logic [7:0] b_i;
    logic [2:0] op_i;
    logic [7:0] alu_o;

    alu dut (
        .a_i(a_i),
        .b_i(b_i),
        .op_i(op_i),
        .alu_o(alu_o)
    );

    initial begin 
        $dumpfile("alu_waves.vcd");
        $dumpvars(0, tb_alu);
        
        $display("Starting Random ALU Test...");
        
        for (int op = 0; op < 8; op++) begin 
            op_i = op[2:0];
            
            case (op_i) 
                3'b000: $display("\n--- Testing ADD (000) ---");
                3'b001: $display("\n--- Testing SUB (001) ---");
                3'b010: $display("\n--- Testing SLL (010) ---");
                3'b011: $display("\n--- Testing LSR (011) ---");
                3'b100: $display("\n--- Testing AND (100) ---");
                3'b101: $display("\n--- Testing OR  (101) ---");
                3'b110: $display("\n--- Testing XOR (110) ---");
                3'b111: $display("\n--- Testing EQL (111) ---");
            endcase

            repeat (5) begin
                a_i = $urandom_range(0, 255); 
                b_i = $urandom_range(0, 255);
                #10;
                $display("A: %3d, B: %3d, OP: %b => ALU Output: %3d", a_i, b_i, op_i, alu_o);
            end
        end 
        a_i = 50; b_i = 50; op_i = 3'b111;
        #10;
        $display("\n--- Manual EQL Check ---");
        $display("A: %3d, B: %3d, OP: %b => ALU Output: %3d", a_i, b_i, op_i, alu_o);

        $display("Test Finished!");
        $finish; 
    end   

endmodule