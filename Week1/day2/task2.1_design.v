module SUMATOR(A, B, Cin, Sum, Cout);
    input A, B, Cin;
    output Sum, Cout;
    wire temp1;
    wire temp2;
    wire temp3;
    wire unand;
    wire rasp;
    xor x0(temp1, A, B);
    xor x1(temp2, temp1, Cin);
    assign Sum = temp2;

    nand na0(temp3, temp1, Cin);
    nand na1(unand, A, B);
    nand na2(rasp, temp3, unand);
    assign Cout = rasp;
endmodule


module SUM4(A, B, Sum);
    input[3:0] A, B;
    output[4:0] Sum;
    wire Cin;
    wire Sum1, Sum2, Sum3, Sum4;
    wire Cout1, Cout2, Cout3, Cout4;
    assign Cin = 0;
    SUMATOR sum0(A[0], B[0], Cin, Sum1, Cout1);
    SUMATOR sum1(A[1], B[1], Cout1, Sum2, Cout2);
    SUMATOR sum2(A[2], B[2], Cout2, Sum3, Cout3);
    SUMATOR sum3(A[3], B[3], Cout3, Sum4, Cout4);
    assign Sum = {Cout4, Sum4, Sum3, Sum2, Sum1};
endmodule