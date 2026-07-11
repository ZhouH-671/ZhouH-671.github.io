module GRF(
    input clk,
    input reset,
    input GRF_WE,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
    input [31:0] currentPC,
    output [31:0] RD1,
    output [31:0] RD2
);

    reg [31:0] registers [0:31];
    integer i;

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            registers[i] = 32'b0;
        end
    end

    assign RD1 = registers[A1];
    assign RD2 = registers[A2];

    always@(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end
        else if (GRF_WE) begin
            if (A3 != 5'b0) begin
                registers[A3] <= WD;
            end

            $display("%d@%h: $%d <= %h", $time, currentPC, A3, WD);
        end
    end
    

endmodule