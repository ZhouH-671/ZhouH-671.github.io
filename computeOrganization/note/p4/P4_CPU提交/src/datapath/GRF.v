module GRF(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
    input GRF_WE,
    input clk,
    input reset,
    input [31:0] currentPC,
    output reg [31:0] RD1,
    output reg [31:0] RD2
);

    reg [31:0] register[0:31];
    integer i;

    always@(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                register[i] <= 32'b0;
            end
        end
        else begin
            if (GRF_WE) begin
                if (A3 != 5'b0) begin
                    register[A3] <= WD;
                end
                
                $display("@%8h: $%d <= %8h", currentPC, A3, WD);
            end
            else begin
                register[A3] <= register[A3];
            end
        end
    end

    always@(*) begin
        RD1 = (A1 == 5'b0)? 32'b0 : register[A1];
        RD2 = (A2 == 5'b0)? 32'b0 : register[A2];
    end

endmodule