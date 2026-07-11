module flowlineW(
    input clk,
    input reset,
    input GRF_WE_M,
    input [1:0] GRF_WD_from_M,
    input [31:0] ALUout_M,
    input [31:0] DMout_M,
    input [31:0] currentPC_M,
    input [31:0] PCplus8_M,
    input [4:0] A3_M,
    output GRF_WE_W,
    output [1:0] GRF_WD_from_W,
    output [31:0] ALUout_W,
    output [31:0] DMout_W,
    output [31:0] currentPC_W,
    output [31:0] PCplus8_W,
    output [4:0] A3_W
);

    reg GRF_WE_W_reg;
    reg [1:0] GRF_WD_from_W_reg;
    reg [31:0] ALUout_W_reg;
    reg [31:0] DMout_W_reg;
    reg [31:0] currentPC_W_reg;
    reg [31:0] PCplus8_W_reg;
    reg [4:0] A3_W_reg;

    assign GRF_WE_W = GRF_WE_W_reg;
    assign GRF_WD_from_W = GRF_WD_from_W_reg;
    assign ALUout_W = ALUout_W_reg;
    assign DMout_W = DMout_W_reg;
    assign currentPC_W = currentPC_W_reg;
    assign PCplus8_W = PCplus8_W_reg;
    assign A3_W = A3_W_reg;

    always @(posedge clk) begin
        if (reset) begin
            GRF_WE_W_reg <= 1'b0;
            GRF_WD_from_W_reg <= 2'b0;
            ALUout_W_reg <= 32'b0;
            DMout_W_reg <= 32'b0;
            currentPC_W_reg <= 32'h0000_0000;
            PCplus8_W_reg <= 32'h0000_0000;
            A3_W_reg <= 5'b0;
        end
        else begin
            GRF_WE_W_reg <= GRF_WE_M;
            GRF_WD_from_W_reg <= GRF_WD_from_M;
            ALUout_W_reg <= ALUout_M;
            DMout_W_reg <= DMout_M;
            currentPC_W_reg <= currentPC_M;
            PCplus8_W_reg <= PCplus8_M;
            A3_W_reg <= A3_M;
        end
    end

endmodule