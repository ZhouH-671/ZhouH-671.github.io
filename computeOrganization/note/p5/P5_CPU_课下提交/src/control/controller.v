`include "./constants.v"

module controller(
    input [5:0] opcode,
    input [5:0] funct,
    output reg isJump,
    output reg GRF_WE,
    output reg [1:0] GRF_WD_from,
    output reg DM_WE,
    output reg [1:0] ALUop,
    output reg ALU_B_from,
    output reg [1:0] GRF_Add_from,
    output reg EXTop,
    output reg [1:0] NPCop
);

    always @(*) begin
        case (opcode)
            `R : begin
                case(funct)
                    `jr : begin
                        isJump = `isJump_YES;
                        GRF_WE = 0;
                        GRF_WD_from = `GRF_WD_from_ALU;
                        DM_WE = 0;
                        ALUop = `ALUop_ADD;
                        ALU_B_from = `ALU_B_from_GRF;
                        GRF_Add_from = `GRF_Add_from_rd;
                        EXTop = `EXTop_UNSIGN;
                        NPCop = `NPCop_JR;
                    end
                    `add : begin
                        isJump = `isJump_NO;
                        GRF_WE = 1;
                        GRF_WD_from = `GRF_WD_from_ALU;
                        DM_WE = 0;
                        ALUop = `ALUop_ADD;
                        ALU_B_from = `ALU_B_from_GRF;
                        GRF_Add_from = `GRF_Add_from_rd;
                        EXTop = `EXTop_UNSIGN;
                        NPCop = `NPCop_BEQ;
                    end
                    `sub : begin
                        isJump = `isJump_NO;
                        GRF_WE = 1;
                        GRF_WD_from = `GRF_WD_from_ALU;
                        DM_WE = 0;
                        ALUop = `ALUop_SUB;
                        ALU_B_from = `ALU_B_from_GRF;
                        GRF_Add_from = `GRF_Add_from_rd;
                        EXTop = `EXTop_UNSIGN;
                        NPCop = `NPCop_BEQ;
                    end
                    default: begin
                        isJump = `isJump_NO;
                        GRF_WE = 0;
                        GRF_WD_from = `GRF_WD_from_ALU;
                        DM_WE = 0;
                        ALUop = `ALUop_ADD;
                        ALU_B_from = `ALU_B_from_GRF;
                        GRF_Add_from = `GRF_Add_from_rt;
                        EXTop = `EXTop_UNSIGN;
                        NPCop = `NPCop_BEQ;
                    end
                endcase
            end
            `ori : begin
                isJump = `isJump_NO;
                GRF_WE = 1;
                GRF_WD_from = `GRF_WD_from_ALU;
                DM_WE = 0;
                ALUop = `ALUop_ORI;
                ALU_B_from = `ALU_B_from_IMM;
                GRF_Add_from = `GRF_Add_from_rt;
                EXTop = `EXTop_UNSIGN;
                NPCop = `NPCop_BEQ;
            end 
            `lw : begin
                isJump = `isJump_NO;
                GRF_WE = 1;
                GRF_WD_from = `GRF_WD_from_DM;
                DM_WE = 0;
                ALUop = `ALUop_ADD;
                ALU_B_from = `ALU_B_from_IMM;
                GRF_Add_from = `GRF_Add_from_rt;
                EXTop = `EXTop_SIGN;
                NPCop = `NPCop_BEQ;
            end
            `sw : begin
                isJump = `isJump_NO;
                GRF_WE = 0;
                GRF_WD_from = `GRF_WD_from_ALU;
                DM_WE = 1;
                ALUop = `ALUop_ADD;
                ALU_B_from = `ALU_B_from_IMM;
                GRF_Add_from = `GRF_Add_from_rt;
                EXTop = `EXTop_SIGN;
                NPCop = `NPCop_BEQ;
            end
            `beq : begin
                isJump = `isJump_YES;
                GRF_WE = 0;
                GRF_WD_from = `GRF_WD_from_ALU;
                DM_WE = 0;
                ALUop = `ALUop_SUB;
                ALU_B_from = `ALU_B_from_GRF;
                GRF_Add_from = `GRF_Add_from_rt;
                EXTop = `EXTop_SIGN;
                NPCop = `NPCop_BEQ;
            end
            `lui : begin
                isJump = `isJump_NO;
                GRF_WE = 1;
                GRF_WD_from = `GRF_WD_from_ALU;
                DM_WE = 0;
                ALUop = `ALUop_LUI;
                ALU_B_from = `ALU_B_from_IMM;
                GRF_Add_from = `GRF_Add_from_rt;
                EXTop = `EXTop_UNSIGN;
                NPCop = `NPCop_BEQ;
            end
            `jal : begin
                isJump = `isJump_YES;
                GRF_WE = 1;
                GRF_WD_from = `GRF_WD_from_JAL;
                DM_WE = 0;
                ALUop = `ALUop_ADD;
                ALU_B_from = `ALU_B_from_GRF;
                GRF_Add_from = `GRF_Add_from_JAL;
                EXTop = `EXTop_UNSIGN;
                NPCop = `NPCop_JAL;
            end
            default : begin
                isJump = `isJump_NO;
                GRF_WE = 0;
                GRF_WD_from = `GRF_WD_from_ALU;
                DM_WE = 0;
                ALUop = `ALUop_ADD;
                ALU_B_from = `ALU_B_from_GRF;
                GRF_Add_from = `GRF_Add_from_rt;
                EXTop = `EXTop_UNSIGN;
                NPCop = `NPCop_BEQ;
            end
        endcase
    end

endmodule