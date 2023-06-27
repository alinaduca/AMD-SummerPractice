module task2;
    reg[3:0] A, B;
    wire[4:0] Sum;
  	SUM4 sum(.A(A), .B(B), .Sum(Sum));
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        #1 A = 0;
        B = 0;
        display;

        #1 A=5;
        B=5;
        display;

        #1 A=15;
        B=15;
        display;
    end
    task display;
      #1 $display("A: %0d, B: %0d, Sum: %0d", A, B, Sum);
    endtask
endmodule