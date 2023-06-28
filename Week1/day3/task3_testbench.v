// `timescale 1ns / 1ps
module task3;
    reg Enable, In0, In1, In2, In3;
    wire Out0Mux, Out1, Out2;
  	ObserverComb obs(.Enable(Enable), .In0(In0), .In1(In1), .In2(In2), .In3(In3), .Out0Mux(Out0Mux), .Out1(Out1), .Out2(Out2));
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        #1 Enable = 0;
        In0 = 0;
        In1 = 0;
        In2 = 0;
        In3 = 0;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 0;
        In1 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 0;
        In1 = 0;
        In0 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 0;
        In1 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 Enable = 1;
        In0 = 0;
        In1 = 0;
        In2 = 0;
        In3 = 0;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 0;
        In1 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 0;
        In1 = 0;
        In0 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 0;
        In1 = 1;
        display;

        #1 In3 = 1;
        display;

        #1 In3 = 0;
        In2 = 1;
        display;

        #1 In3 = 1;
        display;
    end
    task display;
      #1 $display("Enable: %0h, In0: %0h, In1: %0h, In2: %0h, In3: %0h, Out0Mux: %0h, Out1: %0h, Out2: %0h", Enable, In0, In1, In2, In3, Out0Mux, Out1, Out2);
    endtask
endmodule