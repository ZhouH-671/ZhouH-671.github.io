`include "./constants.v"

module ALU(
    input [31:0] A,
    input [31:0] B,
    input [1:0] ALUop,
    output reg [31:0] ALUout
);

    always @(*) begin
        case(ALUop)
            `ALUop_ADD: ALUout = A + B;
            `ALUop_SUB: ALUout = A - B;
            `ALUop_ORI: ALUout = A | B;
            `ALUop_LUI: ALUout = B << 16;
            default: ALUout = 32'b0;
        endcase
    end

endmodule