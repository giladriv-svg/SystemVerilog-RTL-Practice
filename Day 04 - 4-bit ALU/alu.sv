module alu (
    input  logic [7:0] a_i,
    input  logic [7:0] b_i,
    input  logic [2:0] op_i,
    output logic [7:0] alu_o
); 
 always_comb begin
    case (op_i)
    3'b000: alu_o = a_i + b_i; // Addition
    3'b001: alu_o = a_i - b_i; // Subtraction
    3'b010: alu_o = a_i << b_i[2:0]; // Logical left shift
    3'b011: alu_o = a_i >> b_i[2:0]; // Logical right shift
    3'b100: alu_o = a_i & b_i; // Bitwise AND
    3'b101: alu_o = a_i | b_i; // Bitwise OR
    3'b110: alu_o = a_i ^ b_i; // Bit   wise XOR
    3'b111: alu_o = (a_i == b_i) ? 8'd1 : 8'd0; // Equality check
    default: alu_o = 8'b0;      
    endcase

 end

endmodule