module NOT(A, C);
input A;
output C;
assign C = ~A;
endmodule

module OR(A, B, C);
input A, B;
output C;
assign C = A | B;
endmodule

module AND(A, B, C);
input A, B;
output C;
assign C = A & B;
endmodule

module NAND(A, B, C);
input A, B;
output C;
wire temp1;
AND a(A, B, temp1);
assign C = ~temp1;
endmodule

module XOR(A, B, C);
input A, B;
output C;
wire temp1;
wire temp2;
wire n1;
wire n2;
NOT not1(A, n1);
NOT not2(B, n2);
AND a1(n1, B, temp1);
AND a2(A, n2, temp2);
assign C = temp1 | temp2;
endmodule

module FIG2(A, B, C, Y);
input A, B, C;
output Y;
wire notA;
wire not1;
wire not3;
wire temp1;
wire temp2;
wire temp3;
wire temp4;
NOT n1(A, notA);
NAND na1(B, C, temp1);
AND a1(B, temp1, temp2);
AND a2(notA, temp2, temp3);
NOT n2(temp3, not3);

NOT n3(temp1, not1);
XOR x(temp2, not1, temp4);
assign Y = not3 | temp4;
endmodule

module main();
reg _A, _B, _C;
wire _Y;
FIG2 f(_A, _B, _C, _Y);
initial
begin
    $monitor("%d", _Y);
    _A = 1;
    _B = 0;
    _C = 0;
end
endmodule