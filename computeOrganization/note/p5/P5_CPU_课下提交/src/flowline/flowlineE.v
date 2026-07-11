module flowlineE(
    input clk,
    input reset,
    input GRF_WE_D,
    input [1:0] GRF_WD_from_D,
    input DM_WE_D,
    input [1:0] ALUop_D,
    input ALU_B_from_D,
    input [31:0] currentPC_D,
    input [31:0] V1_D,
    input [31:0] V2_D,
    input [31:0] imm32_D,
    input [4:0] rs_D,
    input [4:0] rt_D,
    input [4:0] A3_D,
    input [31:0] PCplus8_D,
    input [1:0] T_new_D,
    output GRF_WE_E,
    output [1:0] GRF_WD_from_E,
    output DM_WE_E,
    output [1:0] ALUop_E,
    output ALU_B_from_E,
    output [31:0] currentPC_E,
    output [31:0] V1_E,
    output [31:0] V2_E,
    output [31:0] imm32_E,
    output [4:0] rs_E,
    output [4:0] rt_E,
    output [4:0] A3_E,
    output [31:0] PCplus8_E,
    output [1:0] T_new_E
);

    reg GRF_WE_E_reg;
    reg [1:0] GRF_WD_from_E_reg;
    reg DM_WE_E_reg;
    reg [1:0] ALUop_E_reg;
    reg ALU_B_from_E_reg;
    reg [31:0] currentPC_E_reg;
    reg [31:0] V1_E_reg;
    reg [31:0] V2_E_reg;
    reg [31:0] imm32_E_reg;
    reg [4:0] rs_E_reg;
    reg [4:0] rt_E_reg;
    reg [4:0] A3_E_reg;
    reg [31:0] PCplus8_E_reg;
    reg [1:0] T_new_E_reg;

    assign GRF_WE_E = GRF_WE_E_reg;
    assign GRF_WD_from_E = GRF_WD_from_E_reg;
    assign DM_WE_E = DM_WE_E_reg;
    assign ALUop_E = ALUop_E_reg;
    assign ALU_B_from_E = ALU_B_from_E_reg;
    assign currentPC_E = currentPC_E_reg;
    assign V1_E = V1_E_reg;
    assign V2_E = V2_E_reg;
    assign imm32_E = imm32_E_reg;
    assign rs_E = rs_E_reg;
    assign rt_E = rt_E_reg;
    assign A3_E = A3_E_reg;
    assign PCplus8_E = PCplus8_E_reg;
    assign T_new_E = T_new_E_reg;

    always@(posedge clk) begin
        if (reset) begin
            GRF_WE_E_reg <= 1'b0;
            GRF_WD_from_E_reg <= 2'b0;
            DM_WE_E_reg <= 1'b0;
            ALUop_E_reg <= 2'b0;
            ALU_B_from_E_reg <= 1'b0;
            currentPC_E_reg <= 32'h0000_0000;
            V1_E_reg <= 32'b0;
            V2_E_reg <= 32'b0;
            imm32_E_reg <= 32'b0;
            rs_E_reg <= 5'b0;
            rt_E_reg <= 5'b0;
            A3_E_reg <= 5'b0;
            PCplus8_E_reg <= 32'h0000_0000;
            T_new_E_reg <= 2'b00;
        end
        else begin
            GRF_WE_E_reg <= GRF_WE_D;
            GRF_WD_from_E_reg <= GRF_WD_from_D;
            DM_WE_E_reg <= DM_WE_D;
            ALUop_E_reg <= ALUop_D;
            ALU_B_from_E_reg <= ALU_B_from_D;
            currentPC_E_reg <= currentPC_D;
            V1_E_reg <= V1_D;
            V2_E_reg <= V2_D;
            imm32_E_reg <= imm32_D;
            rs_E_reg <= rs_D;
            rt_E_reg <= rt_D;
            A3_E_reg <= A3_D;
            PCplus8_E_reg <= PCplus8_D;
            T_new_E_reg <= T_new_D; 
        end
    end


endmodule