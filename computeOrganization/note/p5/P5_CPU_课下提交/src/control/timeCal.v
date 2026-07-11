`include "./constants.v"

module timeCal(
    input [5:0] opcode,
    input [5:0] funct,
    output reg [1:0] rs_T_use,
    output reg [1:0] rt_T_use,
    output reg [1:0] T_new
);

    always @(*) begin
        case(opcode)
            `R : begin
                case(funct)
                    `add : begin
                        rs_T_use = 2'b01;
                        rt_T_use = 2'b01;
                        T_new = 2'b01;
                    end
                    `sub : begin
                        rs_T_use = 2'b01;
                        rt_T_use = 2'b01;
                        T_new = 2'b01;
                    end
                    `jr : begin
                        rs_T_use = 2'b00;
                        rt_T_use = 2'b11;
                        T_new = 2'b00;
                    end
                    default : begin
                        rs_T_use = 2'b11;
                        rt_T_use = 2'b11;
                        T_new = 2'b00;
                    end 
                endcase
            end
            `ori : begin
                rs_T_use = 2'b01;
                rt_T_use = 2'b11;
                T_new = 2'b01;
            end
            `lw : begin
                rs_T_use = 2'b01;
                rt_T_use = 2'b11;
                T_new = 2'b10;
            end
            `sw : begin
                rs_T_use = 2'b01;
                rt_T_use = 2'b10;
                T_new = 2'b00;
            end
            `beq : begin
                rs_T_use = 2'b00;
                rt_T_use = 2'b00;
                T_new = 2'b00;
            end
            `lui : begin
                rs_T_use = 2'b01;
                rt_T_use = 2'b11;
                T_new = 2'b01;
            end
            `jal : begin
                rs_T_use = 2'b11;
                rt_T_use = 2'b11;
                T_new = 2'b10;
            end
            default : begin
                rs_T_use = 2'b11;
                rt_T_use = 2'b11;
                T_new = 2'b00;
            end
        endcase
    end

endmodule