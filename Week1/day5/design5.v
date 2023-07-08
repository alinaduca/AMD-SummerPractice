module fsmMoore(
    input Clk, reset,
    input [1:0] Din,
    output reg Dout0, Dout1
);

    localparam IDLE = 4'b0001;
    localparam S1   = 4'b0010;
    localparam S2   = 4'b0100;
    localparam S3   = 4'b1000;

    reg [3:0] stare_curenta;
    reg [3:0] stare_viitoare;

    //Generare Stare următoare
    always @(Din, stare_curenta)
    begin
        case (stare_curenta)
        IDLE:
            if (Din == 2'b10)
            stare_viitoare = S1;
            else
            stare_viitoare = IDLE;
        S1:
            if(Din == 2'b10)
            stare_viitoare = S2;
            else
            stare_viitoare = IDLE;
        S2:
            if (Din == 2'b10)
            stare_viitoare = S3;
            else
            stare_viitoare = IDLE;
        S3:
            stare_viitoare = IDLE;
        default:
            stare_viitoare = IDLE;
        endcase
    end

    //Memorare Stare curentă
    always @(posedge Clk)
    begin
        if (reset)
        stare_curenta <= IDLE;
        else
        stare_curenta <= stare_viitoare;
    end

    //Generare Output
    always @(stare_curenta)
    begin
        case (stare_curenta)
        IDLE:
            begin
            Dout0 = 1'b0;
            Dout1 = 1'b0;
            end
        S1:
            begin
            Dout0 = 1'b0;
            Dout1 = 1'b0;
            end
        S2:
            begin
            Dout0 = 1'b1;
            Dout1 = 1'b0;
            end
        S3:
            begin
            Dout0 = 1'b1;
            Dout1 = 1'b0;
            end
        default:
            begin
            Dout0 = 1'bx;
            Dout1 = 1'bx;
            end
        endcase
    end
endmodule