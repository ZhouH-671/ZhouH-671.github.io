module flowlineD(
    input clk,
    input enable,
    input reset,
    input [31:0] instr_F,
    input [31:0] currentPC_F,
    input [31:0] PCplus4_F,
    output [31:0]  instr_D,
    output [31:0] currentPC_D,
    output [31:0] PCplus4_D
);

    reg [31:0] instr_D_reg;
    reg [31:0] currentPC_D_reg;
    reg [31:0] PCplus4_D_reg;

    assign instr_D = instr_D_reg;
    assign currentPC_D = currentPC_D_reg;
    assign PCplus4_D = PCplus4_D_reg;

    always@(posedge clk) begin
        if (reset) begin
            instr_D_reg <= 32'b0;
            currentPC_D_reg <= 32'h0000_0000;
            PCplus4_D_reg <= 32'h0000_0000;
        end 
        else if (enable) begin
            instr_D_reg <= instr_F;
            currentPC_D_reg <= currentPC_F;
            PCplus4_D_reg <= PCplus4_F;
        end
    end

endmodule