// constants.v
`ifndef CONSTANTS_V
`define CONSTANTS_V

// isJump
`define isJump_NO 1'b0
`define isJump_YES 1'b1

// GRF_WD_from
`define GRF_WD_from_ALU 2'b00
`define GRF_WD_from_DM 2'b01
`define GRF_WD_from_JAL 2'b10

// ALUop
`define ALUop_ADD 2'b00
`define ALUop_SUB 2'b01
`define ALUop_ORI 2'b10
`define ALUop_LUI 2'b11

// ALU_B_from
`define ALU_B_from_GRF 1'b0
`define ALU_B_from_IMM 1'b1

// GRF_Add_from
`define GRF_Add_from_rt 2'b00
`define GRF_Add_from_rd 2'b01
`define GRF_Add_from_JAL 2'b10

// EXTop
`define EXTop_UNSIGN 1'b0
`define EXTop_SIGN 1'b1

// NPCop
`define NPCop_BEQ 2'b00
`define NPCop_JAL 2'b01
`define NPCop_JR 2'b10

// opcode
`define R 6'b000000
`define add 6'b100000
`define sub 6'b100010
`define jr 6'b001000
`define ori 6'b001101
`define lw 6'b100011
`define sw 6'b101011
`define beq 6'b000100
`define lui 6'b001111
`define jal 6'b000011

`endif // CONSTANTS_V