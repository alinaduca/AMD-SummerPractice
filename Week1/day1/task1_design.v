module FIG1(A, B, C, out);
    input A, B, C;
    output out;
    wire temp1;
    wire temp2;
  	nand na1(temp1, A, B);
  	not n1(temp2, C);
  	and a1(out, temp1, B, temp2);
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
    not n1(A, notA);
    nand na1(temp1, B, C);
  	and a1(temp2, B, temp1);
    and a2(temp3, notA, temp2);
    not n2(not3, temp3);
    not n3(not1, temp1);
    xor x1(temp4, not1, temp2);
  	or o1(Y, not3, temp4);
endmodule