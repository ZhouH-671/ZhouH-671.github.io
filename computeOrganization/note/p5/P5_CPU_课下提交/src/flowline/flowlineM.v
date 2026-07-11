module flowlineM(
    input clk,
    input reset,
    input GRF_WE_E,
    input [1:0] GRF_WD_from_E,
    input DM_WE_E,
    input [31:0] currentPC_E,
    input [31:0] ALUout_E,
    input [31:0] RD2_E,
    input [4:0] A3_E,
    input [31:0] PCplus8_E,
    input [1:0] T_new_E,
    output GRF_WE_M,
    output [1:0] GRF_WD_from_M,
    output DM_WE_M,
    output [31:0] currentPC_M,
    output [31:0] ALUout_M,
    output [31:0] RD2_M,
    output [4:0] A3_M,
    output [31:0] PCplus8_M,
    output [1:0] T_new_M
);

    reg GRF_WE_M_reg;
    reg [1:0] GRF_WD_from_M_reg;
    reg DM_WE_M_reg;
    reg [31:0] currentPC_M_reg;
    reg [31:0] ALUout_M_reg;
    reg [31:0] RD2_M_reg;
    reg [4:0] A3_M_reg;
    reg [31:0] PCplus8_M_reg;
    reg [1:0] T_new_M_reg;

    assign GRF_WE_M = GRF_WE_M_reg;
    assign GRF_WD_from_M = GRF_WD_from_M_reg;
    assign DM_WE_M = DM_WE_M_reg;
    assign currentPC_M = currentPC_M_reg;
    assign ALUout_M = ALUout_M_reg;
    assign RD2_M = RD2_M_reg;
    assign A3_M = A3_M_reg;
    assign PCplus8_M = PCplus8_M_reg;
    assign T_new_M = T_new_M_reg;

    always @(posedge clk) begin
        if (reset) begin
            GRF_WE_M_reg <= 0;
            GRF_WD_from_M_reg <= 2'b00;
            DM_WE_M_reg <= 0;
            currentPC_M_reg <= 32'h0000_0000;
            ALUout_M_reg <= 32'b0;
            RD2_M_reg <= 32'b0;
            A3_M_reg <= 5'b0;
            PCplus8_M_reg <= 32'h0000_0000;
            T_new_M_reg <= 2'b00;
        end else begin
            GRF_WE_M_reg <= GRF_WE_E;
            GRF_WD_from_M_reg <= GRF_WD_from_E;
            DM_WE_M_reg <= DM_WE_E;
            currentPC_M_reg <= currentPC_E;
            ALUout_M_reg <= ALUout_E;
            RD2_M_reg <= RD2_E;
            A3_M_reg <= A3_E;
            PCplus8_M_reg <= PCplus8_E;
            T_new_M_reg <= T_new_E;
        end
    end

endmodule