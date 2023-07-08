module Mux1 #(parameter WIDTH=8) (
    input [WIDTH-1:0] InA,
    input Sel,
    output reg [WIDTH-1:0] Out);

    always @(*)
    begin
        case (Sel)
        1: Out = InA;
        0: Out = {WIDTH{1'b0}};
        default: Out = {WIDTH{1'bz}};
        endcase
    end
endmodule