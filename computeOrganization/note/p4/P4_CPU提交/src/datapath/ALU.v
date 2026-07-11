`define ALU_ADD 2'b00
`define ALU_SUB 2'b01
`define ALU_ORI 2'b10
`define ALU_LUI 2'b11
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [1:0] ALU_op,
    output reg [31:0] ans,
    output reg zero
);

    always@(*) begin
        zero = (A == B)? 1'b1 : 1'b0;
    end

    always@(*) begin
        case(ALU_op)
            `ALU_ADD: ans = A + B;
            `ALU_SUB: ans = A - B;
            `ALU_ORI: ans = A | B;
            `ALU_LUI: ans = {B[15:0], 16'b0};
            default: ans = 32'b0;
        endcase
    end

endmodule