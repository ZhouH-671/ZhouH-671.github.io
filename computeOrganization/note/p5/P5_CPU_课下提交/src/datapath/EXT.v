`include "./constants.v"

module EXT(
    input [15:0] imm16,
    input EXTop,
    output [31:0] imm32
);

    assign imm32 = (EXTop == `EXTop_SIGN) ? {{16{imm16[15]}}, imm16} : 
                    (EXTop == `EXTop_UNSIGN) ? {16'b0, imm16} :
                    32'b0;

endmodule