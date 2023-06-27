module task1;
    reg A, B, C;
    wire out, Y;
  	FIG1 f1(.A(A), .B(B), .C(C), .out(out));
  	FIG2 f2(.A(A), .B(B), .C(C), .Y(Y));  
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        #1 A = 0; B = 0; C = 0;
        display;
        #1 A = 0; B = 0; C = 1;
        display;
        #1 A = 0; B = 1; C = 0;
        display;
        #1 A = 0; B = 1; C = 1;
        display;
        #1 A = 1; B = 0; C = 0;
        display;
        #1 A = 1; B = 0; C = 1;
        display;
        #1 A = 1; B = 1; C = 0;
        display;
        #1 A = 1; B = 1; C = 1;
        display;
    end
    task display;
      #1 $display("A: %0h, B: %0h, C: %0h, out(f1): %0h, Y(f2): %0h", A, B, C, out, Y);
    endtask
endmodule