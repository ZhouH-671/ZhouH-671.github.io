module mips(
    input clk,
    input reset
);

    // Controller wires
    wire [1:0] NPC_op;
    wire GRF_WE;
    wire [1:0] GRF_Address_from;
    wire [1:0] GRF_WD_from;
    wire [1:0] ALU_op;
    wire ALU_B_from;
    wire DM_WE;
    wire EXT_op;

    // IFU wires
    wire [31:0] currentPC;
    wire [31:0] instruction;
    wire [31:0] jal_return_address;

    // Splitter wires
    wire [5:0] opcode;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [5:0] funct;
    wire [15:0] imm16;
    wire [25:0] imm26;

    
    wire beq_zero;
    wire [31:0] add32;

    assign add32 = RD1;
    

    IFU ifu(
        .clk(clk),
        .reset(reset),
        .NPC_op(NPC_op),
        .beq_zero(beq_zero),
        .imm16(imm16),
        .imm26(imm26),
        .add32(add32), //input
        .currentPC(currentPC),
        .instruction(instruction),
        .jal_return_address(jal_return_address) // output
    );

    Splitter splitter(
        .instruction(instruction), // input
        .opcode(opcode),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .shamt(shamt),
        .funct(funct),
        .imm16(imm16),
        .imm26(imm26) // output
    );

    controller controller(
        .opcode(opcode),
        .funct(funct), // input
        .NPC_op(NPC_op),
        .GRF_WE(GRF_WE),
        .GRF_Address_from(GRF_Address_from),
        .GRF_WD_from(GRF_WD_from),
        .ALU_op(ALU_op),
        .ALU_B_from(ALU_B_from),
        .DM_WE(DM_WE),
        .EXT_op(EXT_op) // output
    );

    // GRF wires
    wire [4:0] A1;
    wire [4:0] A2;
    wire [4:0] A3;
    wire [31:0] WD;
    wire [31:0] RD1;
    wire [31:0] RD2;

    assign A1 = rs;
    assign A2 = rt;
    assign A3 = (GRF_Address_from == 2'b00) ? rt :
                    (GRF_Address_from == 2'b01) ? rd :
                    (GRF_Address_from == 2'b10) ? 5'b11111 :
                    5'b00000;
    assign WD = (GRF_WD_from == 2'b00) ? ans :
                    (GRF_WD_from == 2'b01) ? data_output :
                    (GRF_WD_from == 2'b10) ? jal_return_address :
                    32'b0;

    GRF grf(
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .WD(WD),
        .GRF_WE(GRF_WE),
        .clk(clk),
        .reset(reset),
        .currentPC(currentPC),  // input
        .RD1(RD1),
        .RD2(RD2) // output
    );

    // EXT wires
    wire [31:0] imm32;

    EXT ext(
        .imm16(imm16),
        .EXT_op(EXT_op), // input
        .imm32(imm32) // output
    );

    // ALU wires
    wire [31:0] A;
    wire [31:0] B;
    wire [31:0] ans;

    assign A = RD1;
    assign B = (ALU_B_from == 1'b0) ? RD2 :
                    (ALU_B_from == 1'b1) ? imm32 :
                    32'b0;

    ALU alu(
        .A(A),
        .B(B),
        .ALU_op(ALU_op), // input
        .ans(ans),
        .zero(beq_zero) // output
    );

    // DM wires
    wire [31:0] data_input;
    wire [31:0] address;
    wire [31:0] data_output;

    assign data_input = RD2;
    assign address = ans;

    DM dm(
        .clk(clk),
        .reset(reset),
        .DM_WE(DM_WE),
        .address(address),
        .data_input(data_input), 
        .currentPC(currentPC), // input
        .data_output(data_output) // output
    );


endmodule