module ObserverComb(Enable, In0, In1, In2, In3, Out0Mux, Out1, Out2);
    input Enable, In0, In1, In2, In3;
    output Out0Mux, Out1, Out2;
    wire temp0;
    wire temp1;
    wire temp2;
    wire temp3;
    wire temp4;
    wire temp5;
    wire temp6;
    wire temp7;
    wire temp8;
    wire temp9;
    wire temp10;
    wire temp11;
    wire notIn0;
    wire notIn1;
    wire notIn2;
    wire notIn3;
    wire rasp0, rasp1, rasp2;
    not n0(notIn0, In0);
    not n1(notIn1, In1);
    not n2(notIn2, In2);
    not n3(notIn3, In3);

    //Out0Mux
    and a0(temp1, Enable, In0, notIn1, In3);
    and a1(temp2, Enable, notIn0, notIn1, In2);
    or  o0(rasp0, temp1, temp2);
    assign Out0Mux = rasp0;

    //Out1
    and a2(temp0, Enable, In0, notIn1, notIn2, In3);
    and a3(temp3, Enable, In0, notIn1, In2, notIn3);
    and a4(temp4, Enable, In0, In1, notIn2, notIn3);
    and a5(temp5, Enable, notIn0, notIn1, In2, In3);
    and a6(temp6, Enable, notIn0, In1, In2, notIn3);
    and a7(temp7, Enable, notIn0, In1, notIn2, In3);
    or  o1(rasp1, temp0, temp3, temp4, temp5, temp6, temp7);
    assign Out1 = rasp1;

    //Out2
    and  a8(temp8,  Enable, In0, notIn1, In2, In3);
    and  a9(temp9,  Enable, In0, In1, In2, notIn3);
    and a10(temp10, Enable, In0, In1, notIn2, In3);
    and a11(temp11, Enable, notIn0, In1, In2, In3);
    or   o2(rasp2, temp8, temp9, temp10, temp11);
    assign Out2 = rasp2;
endmodule