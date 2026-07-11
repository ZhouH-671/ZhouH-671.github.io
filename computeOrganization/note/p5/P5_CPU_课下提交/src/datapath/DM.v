module DM(
    input clk,
    input reset,
    input DM_WE,
    input [31:0] currentPC,
    input [31:0] A,
    input [31:0] WD,
    output [31:0] RD
);

    reg [31:0] dataMemory [0:3071];
    integer i;

    initial begin
        for (i = 0; i < 3072; i = i + 1) begin
            dataMemory[i] = 32'b0;
        end
    end

    assign RD = dataMemory[A[13:2]];

    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 3072; i = i + 1) begin
                dataMemory[i] <= 32'b0;
            end
        end
        else if (DM_WE) begin
            dataMemory[A[13:2]] <= WD;
            $display("%d@%h: *%h <= %h", $time, currentPC, A, WD);
        end
    end

endmodule