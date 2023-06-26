module NOT(A, C);
input A;
output C;
assign C = ~A;
endmodule

module AND(A, B, C);
input A, B;
output C;
assign C = A & B;
endmodule

module FIG1(A, B, C, out);
input A, B, C;
output out;
wire temp1;
wire temp2;
wire temp3;
wire temp4;
AND a0(A, B, temp1);
NOT n1(temp1, temp2);
NOT n2(C, temp3);
AND a1(temp2, B, temp4); //and cu 3 intrari = 2 porti and cu 2 intrari
AND a2(temp3, temp4, out);
endmodule

module main();
reg _A, _B, _C;
wire _out;
FIG1 f(_A, _B, _C, _out);
initial
begin
    $monitor("%d", _out);
    _A  = 1;
    _B  = 0;
    _C = 0;
end
endmodule