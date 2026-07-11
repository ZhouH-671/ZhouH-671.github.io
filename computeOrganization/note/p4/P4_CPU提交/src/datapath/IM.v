module IM(
    input [31:0] currentPC,
    output [31:0] instruction
);

    reg [31:0] memory [0:4095];
    wire [31:0] IM_address = currentPC - 32'h0000_3000;

    initial begin
        $readmemh("code.txt", memory);
    end

    assign instruction = memory[ IM_address[13:2] ];

endmodule