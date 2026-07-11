module EXT(
    input [15:0] imm16,
    input EXT_op,
    output reg [31:0] imm32
);

    always@(*) begin
        if (EXT_op == 1) begin
            imm32 = {{16{imm16[15]}}, imm16};
        end
        else begin
            imm32 = {16'b0, imm16};
        end
    end

endmodule