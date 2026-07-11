module DM(
    input clk,
    input reset,
    input DM_WE,
    input [31:0] address,
    input [31:0] data_input,
    input [31:0] currentPC,
    output reg [31:0] data_output
);

    reg [31:0] memory[0:3071];
    wire [11:0] address_real = address[13:2];
    integer i;

    always@(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 3072; i = i + 1) begin
                memory[i] <= 32'b0;
            end
        end
        else begin
            if (DM_WE) begin
                memory[address_real] <= data_input;

                $display("@%h: *%h <= %h", currentPC, address, data_input);
            end
        end
    end

    always@(*) begin
        data_output = memory[address_real];
    end

endmodule