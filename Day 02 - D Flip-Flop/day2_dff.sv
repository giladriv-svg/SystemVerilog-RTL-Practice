module day2_dff (
    input  logic clk,
    input  logic rst,
    input  logic d_i,
    output logic q_norst_o,
    output logic q_syncrst_o,
    output logic q_asyncrst_o
);

    // ==========================================
    // 1. D Flip-Flop with NO Reset
    // ==========================================
    always_ff @(posedge clk) begin
       q_norst_o <= d_i;
    end

    // ==========================================
    // 2. D Flip-Flop with SYNCHRONOUS Reset
    // ==========================================
    always_ff @(posedge clk) begin
       if (rst) begin
           q_syncrst_o <= 1'b0;
       end else begin
        q_syncrst_o <= d_i;
       end
    end

    // ==========================================
    // 3. D Flip-Flop with ASYNCHRONOUS Reset
    // ==========================================
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
           q_asyncrst_o <= 1'b0;
       end else begin
        q_asyncrst_o <= d_i;
       end
    end


endmodule