// Code your testbench here
// or browse Examples
module task2;
    reg[0:7] InA, InB, InC;
    reg[0:3] InD, InE;
    wire[0:31] Out;
  	CONCATENATE conc(.InA(InA), .InB(InB), .InC(InC), .InD(InD), .InE(InE), .Out(Out));
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        #1 InA = 8'b11111111;
        InB = 8'b10101010;
        InC = 8'b01010101;
        InD = 4'b0000;
        InE = 4'b1111;
        display;
    end
    task display;
      #1 $display("InA: %0h, InB: %0h, InC: %0h, InD: %0h, InE: %0h, Out: %0h", InA, InB, InC, InD, InE, Out);
    endtask
endmodule