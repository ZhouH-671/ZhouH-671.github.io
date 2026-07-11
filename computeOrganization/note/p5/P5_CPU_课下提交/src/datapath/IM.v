module IM(
    input [31:0] addr,
    output [31:0] instr
);

    reg [31:0] imemory [4095:0];
    wire [31:0] IM_addr = addr - 32'h0000_3000;

    initial begin
        $readmemh("./code.txt",imemory);
    end

    assign instr = imemory[IM_addr[13:2]];

endmodule