`define R 6'b000000
`define R_ADD 6'b100000
`define R_SUB 6'b100010
`define R_JR 6'b001000
`define ORI 6'b001101
`define LW 6'b100011
`define SW 6'b101011
`define BEQ  6'b000100
`define LUI 6'b001111
`define JAL 6'b000011
module controller(
    input [5:0] opcode,
    input [5:0] funct,
    output reg [1:0] NPC_op,
    output reg GRF_WE,
    output reg [1:0] GRF_Address_from,
    output reg [1:0] GRF_WD_from,
    output reg [1:0] ALU_op,
    output reg ALU_B_from,
    output reg DM_WE,
    output reg EXT_op
);

    always@(*) begin
        case(opcode)
            `R:begin
                case(funct)
                    `R_ADD:begin
                        NPC_op = 2'b00;
                        GRF_WE = 1'b1;
                        GRF_Address_from = 2'b01;
                        GRF_WD_from = 2'b00;
                        ALU_op = 2'b00;
                        ALU_B_from = 1'b0;
                        DM_WE = 1'b0;
                        EXT_op = 1'b0;
                    end
                    `R_SUB:begin
                        NPC_op = 2'b00;
                        GRF_WE = 1'b1;
                        GRF_Address_from = 2'b01;
                        GRF_WD_from = 2'b00;
                        ALU_op = 2'b01;
                        ALU_B_from = 1'b0;
                        DM_WE = 1'b0;
                        EXT_op = 1'b0;
                    end
                    `R_JR:begin
                        NPC_op = 2'b11;
                        GRF_WE = 1'b0;
                        GRF_Address_from = 2'b00;
                        GRF_WD_from = 2'b00;
                        ALU_op = 2'b00;
                        ALU_B_from = 1'b0;
                        DM_WE = 1'b0;
                        EXT_op = 1'b0;
                    end
                    default: begin
                        NPC_op = 2'b00;
                        GRF_WE = 1'b0;
                        GRF_Address_from = 2'b00;
                        GRF_WD_from = 2'b00;
                        ALU_op = 2'b00;
                        ALU_B_from = 1'b0;
                        DM_WE = 1'b0;
                        EXT_op = 1'b0;
                    end
                endcase
            end
            `ORI: begin
                NPC_op = 2'b00;
                GRF_WE = 1'b1;
                GRF_Address_from = 2'b00;
                GRF_WD_from = 2'b00;
                ALU_op = 2'b10;
                ALU_B_from = 1'b1;
                DM_WE = 1'b0;
                EXT_op = 1'b0;
            end
            `LW: begin
                NPC_op = 2'b00;
                GRF_WE = 1'b1;
                GRF_Address_from = 2'b00;
                GRF_WD_from = 2'b01;
                ALU_op = 2'b00;
                ALU_B_from = 1'b1;
                DM_WE = 1'b0;
                EXT_op = 1'b1;
            end
            `SW: begin
                NPC_op = 2'b00;
                GRF_WE = 1'b0;
                GRF_Address_from = 2'b00;
                GRF_WD_from = 2'b00;
                ALU_op = 2'b00;
                ALU_B_from = 1'b1;
                DM_WE = 1'b1;
                EXT_op = 1'b1;
            end
            `BEQ: begin
                NPC_op = 2'b01;
                GRF_WE = 1'b0;
                GRF_Address_from = 2'b00;
                GRF_WD_from = 2'b00;
                ALU_op = 2'b00;
                ALU_B_from = 1'b0;
                DM_WE = 1'b0;
                EXT_op = 1'b1;
            end
            `LUI: begin
                NPC_op = 2'b00;
                GRF_WE = 1'b1;
                GRF_Address_from = 2'b00;
                GRF_WD_from = 2'b00;
                ALU_op = 2'b11;
                ALU_B_from = 1'b1;
                DM_WE = 1'b0;
                EXT_op = 1'b0;
            end
            `JAL: begin
                NPC_op = 2'b10;
                GRF_WE = 1'b1;
                GRF_Address_from = 2'b10;
                GRF_WD_from = 2'b10;
                ALU_op = 2'b00;
                ALU_B_from = 1'b0;
                DM_WE = 1'b0;
                EXT_op = 1'b0;
            end
            default: begin
                NPC_op = 2'b00;
                GRF_WE = 1'b0;
                GRF_Address_from = 2'b00;
                GRF_WD_from = 2'b00;
                ALU_op = 2'b00;
                ALU_B_from = 1'b0;
                DM_WE = 1'b0;
                EXT_op = 1'b0;
            end
        endcase
    end

endmodule