`include "./constants.v"

module mips(
    input clk,
    input reset
);

    /* --------------- Fetch Stage --------------- */
    // 用到的D阶段的信号
    wire [31:0] nextPC_D;
    wire isJump;

    // 用到forward的信号
    wire isblocked;

    // F阶段的信号
    wire enableN_F;
    wire [31:0] currentPC_F;
    wire [31:0] PCplus4_F;
    wire [31:0] instr_F;
    wire [31:0] jumpPC_F;
    wire [31:0] nextPC_F;

    assign PCplus4_F = currentPC_F + 4;
    assign nextPC_F = PCplus4_F;
    assign jumpPC_F = nextPC_D;
    assign enableN_F = (isblocked == 1'b1) ? 1'b0 : 1'b1;

    PC pc(
        .clk(clk),
        .reset(reset),
        .enable(enableN_F),
        .isJump(isJump),
        .jumpPC(jumpPC_F),
        .nextPC(nextPC_F),
        .currentPC(currentPC_F)
    );

    IM im(
        .addr(currentPC_F),
        .instr(instr_F)
    );

    /* --------------- Docode Stage --------------- */
    //用到的W阶段的信号
    wire GRF_WE_W;
    wire [4:0] A3_W;
    wire [31:0] result_W;
    wire [31:0] currentPC_W;

    // D阶段流水线的信号
    wire enableN_D;
    wire [31:0] instr_D;
    wire [31:0] currentPC_D;
    wire [31:0] PCplus4_D;

    assign enableN_D = (isblocked == 1'b1) ? 1'b0 : 1'b1;

    flowlineD flowlineD(
        .clk(clk),
        .enable(enableN_D),
        .reset(reset),
        .instr_F(instr_F),
        .currentPC_F(currentPC_F),
        .PCplus4_F(PCplus4_F),
        .instr_D(instr_D),
        .currentPC_D(currentPC_D),
        .PCplus4_D(PCplus4_D)
    );

    // D阶段Splitter的信号
    wire [5:0] opcode;
    wire [4:0] rs_D;
    wire [4:0] rt_D;
    wire [4:0] rd_D;
    wire [15:0] imm16_D;
    wire [25:0] imm26_D;
    wire [4:0] shamt;
    wire [5:0] funct;

    Splitter splitter(
        .instr(instr_D),
        .opcode(opcode),
        .rs(rs_D),
        .rt(rt_D),
        .rd(rd_D),
        .imm16(imm16_D),
        .imm26(imm26_D),
        .shamt(shamt),
        .funct(funct)
    );

    // D阶段controller的信号
    //wire isJump;
    wire GRF_WE_D;
    wire [1:0] GRF_WD_from_D;
    wire DM_WE_D;
    wire [1:0] ALUop_D;
    wire ALU_B_from_D;
    wire [1:0] GRF_Add_from_D;
    wire EXTop_D;
    wire [1:0] NPCop_D;

    //计算每条指令的rs_T_use和rt_T_use和T_new
    wire [1:0] rs_T_use;
    wire [1:0] rt_T_use;
    wire [1:0] T_new_D;

    timeCal timeCal(
        .opcode(opcode),
        .funct(funct),
        .rs_T_use(rs_T_use),
        .rt_T_use(rt_T_use),
        .T_new(T_new_D)
    );

    controller controller(
        .opcode(opcode),
        .funct(funct),
        .isJump(isJump),
        .GRF_WE(GRF_WE_D),
        .GRF_WD_from(GRF_WD_from_D),
        .DM_WE(DM_WE_D),
        .ALUop(ALUop_D),
        .ALU_B_from(ALU_B_from_D),
        .GRF_Add_from(GRF_Add_from_D),
        .EXTop(EXTop_D),
        .NPCop(NPCop_D)
    );

    // D阶段GRF的信号
    wire [31:0] RD1_D;
    wire [31:0] RD2_D;
    wire clk_GRF;
    assign clk_GRF = ~clk;

    GRF grf(
        .clk(clk_GRF),
        .reset(reset),
        .GRF_WE(GRF_WE_W),
        .A1(rs_D),
        .A2(rt_D),
        .A3(A3_W),
        .WD(result_W),
        .currentPC(currentPC_W),
        .RD1(RD1_D),
        .RD2(RD2_D)
    );

    // 转发数据
    wire [31:0] ALUout_M;
    wire [31:0] PCplus8_M;
    // wire [31:0] result_W;

    // rs转发
    wire [31:0] MF_RD1_D;
    wire [1:0] rs_isMF_D;
    assign MF_RD1_D = (rs_isMF_D == 2'b10) ? ALUout_M :
                        (rs_isMF_D == 2'b01) ? result_W : 
                        RD1_D; 
    
    // rt转发
    wire [31:0] MF_RD2_D;
    wire [1:0] rt_isMF_D;
    assign MF_RD2_D = (rt_isMF_D == 2'b10) ? ALUout_M :
                        (rt_isMF_D == 2'b01) ? result_W : 
                        RD2_D;
    
    // 比较信号前移
    wire beq_zero;
    assign beq_zero = (MF_RD1_D == MF_RD2_D) ? 1'b1 : 1'b0;

    // D阶段EXT的信号
    wire [31:0] imm32_D;

    EXT ext(
        .imm16(imm16_D),
        .EXTop(EXTop_D),
        .imm32(imm32_D)
    );

    // D阶段NPC的信号
    // wire [31:0] nextPC_D;
    // wire [31:0] PCplus4_D;
    wire [31:0] PCplus8_D;

    wire [31:0] add32;
    assign add32 = (rs_D == A3_M && GRF_WE_M == 1'b1 && rs_D == 5'h1f) ? PCplus8_M :
                    MF_RD1_D;

    NPC npc(
        .PCplus4(PCplus4_D),
        .imm16(imm16_D),
        .imm26(imm26_D),
        .add32(add32),
        .NPCop(NPCop_D),
        .beq_zero(beq_zero),
        .nextPC(nextPC_D),
        .jal_return_address(PCplus8_D)
    );

    // GRF地址选择
    wire [4:0] A3_D;
    assign A3_D = (GRF_Add_from_D == `GRF_Add_from_rt) ? rt_D :
                    (GRF_Add_from_D == `GRF_Add_from_rd) ? rd_D :
                    (GRF_Add_from_D == `GRF_Add_from_JAL) ? 5'b11111 :
                    5'b00000;

    /* --------------- Execute Stage --------------- */
    // E阶段流水线的信号
    wire reset_E;
    wire GRF_WE_E;
    wire [1:0] GRF_WD_from_E;
    wire DM_WE_E;
    wire [1:0] ALUop_E;
    wire ALU_B_from_E;
    wire [31:0] currentPC_E;
    wire [31:0] V1_E;
    wire [31:0] V2_E;
    wire [31:0] imm32_E;
    wire [4:0] rs_E;
    wire [4:0] rt_E;
    wire [4:0] A3_E;
    wire [31:0] PCplus8_E;
    wire [1:0] T_new_E;

    assign reset_E = reset | isblocked;

    flowlineE flowlineE(
        .clk(clk),
        .reset(reset_E),
        .GRF_WE_D(GRF_WE_D),
        .GRF_WD_from_D(GRF_WD_from_D),
        .DM_WE_D(DM_WE_D),
        .ALUop_D(ALUop_D),
        .ALU_B_from_D(ALU_B_from_D),
        .currentPC_D(currentPC_D),
        .V1_D(RD1_D),
        .V2_D(RD2_D),
        .imm32_D(imm32_D),
        .rs_D(rs_D),
        .rt_D(rt_D),
        .A3_D(A3_D),
        .PCplus8_D(PCplus8_D),
        .T_new_D(T_new_D),
        .GRF_WE_E(GRF_WE_E),
        .GRF_WD_from_E(GRF_WD_from_E),
        .DM_WE_E(DM_WE_E), 
        .ALUop_E(ALUop_E),
        .ALU_B_from_E(ALU_B_from_E),
        .currentPC_E(currentPC_E),
        .V1_E(V1_E),
        .V2_E(V2_E),
        .imm32_E(imm32_E),
        .rs_E(rs_E),
        .rt_E(rt_E),
        .A3_E(A3_E),
        .PCplus8_E(PCplus8_E),
        .T_new_E(T_new_E)
    );

    // rs转发判断
    wire [31:0] MF_RD1_E;
    wire [1:0] rs_isMF_E;
    assign MF_RD1_E = (rs_isMF_E == 2'b10) ? ALUout_M :
                        (rs_isMF_E == 2'b01) ? result_W :
                        (rs_isMF_E == 2'b00) ? V1_E :
                        32'b0;
    // rt转发判断
    wire [31:0] MF_RD2_E;
    wire [1:0] rt_isMF_E;
    assign MF_RD2_E = (rt_isMF_E == 2'b10) ? ALUout_M :
                        (rt_isMF_E == 2'b01) ? result_W :
                        (rt_isMF_E == 2'b00) ? V2_E :
                        32'b0;
    
    // ALU信号
    wire [31:0] Src_A;
    assign Src_A = MF_RD1_E;

    wire [31:0] Src_B;
    assign Src_B = (ALU_B_from_E == `ALU_B_from_GRF) ? MF_RD2_E :
                    (ALU_B_from_E == `ALU_B_from_IMM) ? imm32_E :
                    32'b0;
    
    wire [31:0] ALUout_E;

    ALU alu(
        .A(Src_A),
        .B(Src_B),
        .ALUop(ALUop_E),
        .ALUout(ALUout_E)
    );

    wire [1:0] T_new_M_input;
    assign T_new_M_input = (T_new_E >= 1) ? (T_new_E - 1) : 2'b00;

    /* --------------- Memory Stage --------------- */
    // M阶段流水线信号
    wire GRF_WE_M;
    wire [1:0] GRF_WD_from_M;
    wire DM_WE_M;

    // wire [31:0] ALUout_M;
    wire [31:0] MF_RD2_M;
    wire [4:0] A3_M;
    wire [31:0] currentPC_M;
    // wire [31:0] PCplus8_M;
    wire [1:0] T_new_M;

    flowlineM flowlineM(
        .clk(clk),
        .reset(reset),
        .GRF_WE_E(GRF_WE_E),
        .GRF_WD_from_E(GRF_WD_from_E),
        .DM_WE_E(DM_WE_E),
        .currentPC_E(currentPC_E),
        .ALUout_E(ALUout_E),
        .RD2_E(MF_RD2_E),
        .A3_E(A3_E),
        .PCplus8_E(PCplus8_E),
        .T_new_E(T_new_M_input),
        .GRF_WE_M(GRF_WE_M),
        .GRF_WD_from_M(GRF_WD_from_M),
        .DM_WE_M(DM_WE_M),
        .currentPC_M(currentPC_M),
        .ALUout_M(ALUout_M),
        .RD2_M(MF_RD2_M),
        .A3_M(A3_M),
        .PCplus8_M(PCplus8_M),
        .T_new_M(T_new_M)
    );

    // DM
    wire [31:0] DMout_M;

    DM dm(
        .clk(clk),
        .reset(reset),
        .DM_WE(DM_WE_M),
        .currentPC(currentPC_M),
        .A(ALUout_M),
        .WD(MF_RD2_M),
        .RD(DMout_M)
    );

    /* --------------- WriteBack Stage --------------- */
    // W阶段信号
    // wire GRF_WE_W;
    wire [1:0] GRF_WD_from_W;
    wire [31:0] DMout_W;
    wire [31:0] ALUout_W;
    //wire [31:0] currentPC_W;
    wire [31:0] PCplus8_W; 
    //wire [4:0] A3_W;
    
    flowlineW flowlineW(
        .clk(clk),
        .reset(reset),
        .GRF_WE_M(GRF_WE_M),
        .GRF_WD_from_M(GRF_WD_from_M),
        .ALUout_M(ALUout_M),
        .DMout_M(DMout_M),
        .currentPC_M(currentPC_M),
        .PCplus8_M(PCplus8_M),
        .A3_M(A3_M),
        .GRF_WE_W(GRF_WE_W),
        .GRF_WD_from_W(GRF_WD_from_W),
        .ALUout_W(ALUout_W),
        .DMout_W(DMout_W),
        .currentPC_W(currentPC_W),
        .PCplus8_W(PCplus8_W),
        .A3_W(A3_W)
    );

    assign result_W = (GRF_WD_from_W == `GRF_WD_from_ALU) ? ALUout_W :
                        (GRF_WD_from_W == `GRF_WD_from_DM) ? DMout_W :
                        (GRF_WD_from_W == `GRF_WD_from_JAL) ? PCplus8_W :
                        32'b0;

    /* --------------- forward --------------- */
    forward forward(
        .rs_D(rs_D),
        .rt_D(rt_D),
        .GRF_WE_M(GRF_WE_M),
        .A3_M(A3_M),
        .rs_E(rs_E),
        .rt_E(rt_E),
        .GRF_WE_W(GRF_WE_W),
        .A3_W(A3_W),
        .rs_T_use(rs_T_use),
        .rt_T_use(rt_T_use),
        .T_new_E(T_new_E),
        .T_new_M(T_new_M),
        .isblocked(isblocked),
        .rs_isMF_D(rs_isMF_D),
        .rt_isMF_D(rt_isMF_D),
        .rs_isMF_E(rs_isMF_E),
        .rt_isMF_E(rt_isMF_E)
    );

endmodule