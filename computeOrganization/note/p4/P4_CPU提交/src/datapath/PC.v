module PC(
    input clk,
    input reset,
    input [31:0] nextPC,
    output reg [31:0] currentPC
);

    reg [31:0] pc_register;

    always@(posedge clk) begin
        if (reset) begin
            pc_register <= 32'h0000_3000;
        end
        else begin
            pc_register <= nextPC;
        end
    end

    always@(*) begin
        currentPC = pc_register;
    end

endmodule