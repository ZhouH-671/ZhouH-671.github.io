`include "./constants.v"

module NPC(
    input [31:0] PCplus4,
    input [15:0] imm16,
    input [25:0] imm26,
    input [31:0] add32,
    input [1:0] NPCop,
    input beq_zero,
    output [31:0] nextPC,
    output [31:0] jal_return_address 
);


    wire [31:0] imm32;
    assign imm32 = {{14{imm16[15]}}, imm16, 2'b00};

    wire [31:0] currentPC;
    assign currentPC = PCplus4 - 4;

    assign jal_return_address = PCplus4 + 4;

    assign nextPC = (NPCop == `NPCop_BEQ) ? (beq_zero ? (PCplus4 + imm32) : (PCplus4)) :
                    (NPCop == `NPCop_JAL) ? {currentPC[31:28], imm26, 2'b00} :
                    (NPCop == `NPCop_JR) ? add32 :
                    PCplus4;

endmodule