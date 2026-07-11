`define NPC_SEQ 2'b00
`define NPC_BEQ 2'b01
`define NPC_JAL 2'b10
`define NPC_JR 2'b11
module NPC(
    input [31:0] currentPC,
    input [1:0] NPC_op,
    input beq_zero,
    input [15:0] imm16,
    input [25:0] imm26,
    input [31:0] add32,
    output reg [31:0] nextPC,
    output reg [31:0] jal_return_address
);

    always@(*) begin
        jal_return_address = currentPC + 32'h0000_0004;

        case(NPC_op)
            `NPC_SEQ: begin
                nextPC = currentPC + 32'h0000_0004;
            end
            `NPC_BEQ: begin
                if (beq_zero) begin
                    nextPC = currentPC + 32'h0000_0004 + {{14{imm16[15]}}, imm16, 2'b00};
                end
                else begin
                    nextPC = currentPC + 32'h0000_0004;
                end
            end
            `NPC_JAL: begin
                nextPC = {currentPC[31:28], imm26, 2'b00};    
            end
            `NPC_JR: begin
                nextPC = add32;
            end
        endcase
    end

endmodule