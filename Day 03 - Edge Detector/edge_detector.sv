module edge_detector (
    input  logic clk,
    input logic rst,
    input  logic signal_i,
    output logic rising_edge_o,
    output logic falling_edge_o
);
 
logic d_i;

always_ff @(posedge clk) begin
       if (rst) begin
           d_i <= 1'b0;
       end else begin
        d_i <= signal_i;
       end
    end


  // Rising edge when delayed signal is 0 but current is 1
assign rising_edge_o = signal_i & ~d_i& !rst;;


  // Falling edge when delayed signal is 1 but current is 0
assign falling_edge_o = ~signal_i & d_i & !rst;;

endmodule