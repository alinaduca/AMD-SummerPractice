module Mux4 #(parameter WIDTH=32) (
    input [WIDTH-1:0] ConcatOut, Dout,
    input CtrlModeTmp,
    output reg [WIDTH-1:0] TxDinTmp);

    always @(*)
    begin
        case(CtrlModeTmp)
        0: TxDinTmp = ConcatOut;
        1: TxDinTmp = Dout;
        default: TxDinTmp = {WIDTH{1'bz}};
        endcase
    end
endmodule