module Memory #(parameter WIDTH=8, DinLENGTH=32) (
    input Clk,
    input Reset,
    input Valid,
    input R_W,
    input [WIDTH-1:0] Addr,
    input [DinLENGTH-1:0] Din,
    output [DinLENGTH-1:0] Dout
);

    integer i;
    reg [DinLENGTH-1:0] memory [0:WIDTH-1];
    reg [DinLENGTH-1:0] dout_reg;
    
    always @(posedge Clk, posedge Reset) begin
        if (Reset) begin
            for (i = 0; i < WIDTH; i = i + 1) begin
                memory[i] <= 0;
            end
            dout_reg <= 0;
        end else if (Valid) begin
            if (R_W == 0) begin
                dout_reg <= memory[Addr];
            end else begin
                memory[Addr] <= Din;
            end
        end else begin
            dout_reg <= 0;
        end
    end

    assign Dout = dout_reg;

endmodule
