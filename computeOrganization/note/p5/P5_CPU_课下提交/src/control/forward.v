module forward(
    input [4:0] rs_D,
    input [4:0] rt_D,
    input GRF_WE_M,
    input [4:0] A3_M,
    input [4:0] rs_E,
    input [4:0] rt_E,
    input GRF_WE_W,
    input [4:0] A3_W,
    input [1:0] rs_T_use,
    input [1:0] rt_T_use,
    input [1:0] T_new_E,
    input [1:0] T_new_M,
    output isblocked,
    output reg [1:0] rs_isMF_D,
    output reg [1:0] rt_isMF_D,
    output reg [1:0] rs_isMF_E,
    output reg [1:0] rt_isMF_E
);

    assign isblocked = (rs_T_use < T_new_E) | 
                        (rs_T_use < T_new_M) |
                        (rt_T_use < T_new_E) |
                        (rt_T_use < T_new_M);

    always @(*) begin
        if (rs_D == A3_M && GRF_WE_M == 1'b1 && rs_D != 5'b0) begin
            rs_isMF_D = 2'b10;
        end
        else if (rs_D == A3_W && GRF_WE_W == 1'b1 && rs_D != 5'b0) begin
            rs_isMF_D = 2'b01;
        end
        else rs_isMF_D = 2'b00;
    end

    always @(*) begin
        if (rt_D == A3_M && GRF_WE_M == 1'b1 && rt_D != 5'b0) begin
            rt_isMF_D = 2'b10;
        end
        else if (rt_D == A3_W && GRF_WE_W == 1'b1 && rt_D != 5'b0) begin
            rt_isMF_D = 2'b01;
        end
        else rt_isMF_D = 2'b00;
    end

    always @(*) begin
        if (rs_E == A3_M && GRF_WE_M == 1'b1 && rs_E != 5'b0) begin
            rs_isMF_E = 2'b10;
        end
        else if (rs_E == A3_W && GRF_WE_W == 1'b1 && rs_E != 5'b0) begin
            rs_isMF_E = 2'b01;
        end
        else rs_isMF_E = 2'b00;
    end

    always @(*) begin
        if (rt_E == A3_M && GRF_WE_M == 1'b1 && rt_E != 5'b0) begin
            rt_isMF_E = 2'b10;
        end
        else if (rt_E == A3_W && GRF_WE_W == 1'b1 && rt_E != 5'b0) begin
            rt_isMF_E = 2'b01;
        end
        else rt_isMF_E = 2'b00;
    end

endmodule