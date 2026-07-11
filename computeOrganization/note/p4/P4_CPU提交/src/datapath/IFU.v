module IFU(
    input clk,
    input reset,
    input [1:0] NPC_op,
    input beq_zero,
    input [15:0] imm16,
    input [25:0] imm26,
    input [31:0] add32,
    output [31:0] currentPC,
    output [31:0] instruction,
    output [31:0] jal_return_address
);

    wire [31:0] nextPC;

    PC pc(
        .clk(clk),
        .reset(reset),
        .nextPC(nextPC),
        .currentPC(currentPC)
    );
    NPC npc(
        .currentPC(currentPC),
        .NPC_op(NPC_op),
        .beq_zero(beq_zero),
        .imm16(imm16),
        .imm26(imm26),
        .add32(add32),
        .nextPC(nextPC),
        .jal_return_address(jal_return_address)  
    );
    IM im(
        .currentPC(currentPC),
        .instruction(instruction)
    );

    

endmodule