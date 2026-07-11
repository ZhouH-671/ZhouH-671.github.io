module PC(
    input clk,
    input reset,
    input enable,
    input isJump,
    input [31:0] jumpPC,
    input [31:0] nextPC,
    output [31:0] currentPC
);

    reg [31:0] pc_reg;

    // 组合逻辑
    assign currentPC = pc_reg;

    // 时序逻辑
    always@(posedge clk) begin
        if (reset) begin
            pc_reg <= 32'h0000_3000;
        end
        else if (enable) begin
            if (isJump) begin
                pc_reg <= jumpPC;
            end
            else begin
                pc_reg <= nextPC;
            end
        end
    end

endmodule