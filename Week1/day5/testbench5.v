module taskMOORE;
  reg Clk, reset;
  reg [1:0] Din;
  wire Dout0, Dout1;
  fsmMoore fsm (
    .Clk(Clk),
    .reset(reset),
    .Din(Din),
    .Dout0(Dout0),
    .Dout1(Dout1)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    Clk = 0;
    reset=0;
    Din = 10;
    #5 Din = 10;
    #5 Din = 10;
    $display;

    #40 $finish;
  end

  always begin
    #1 $display("Clk = %b",
                 Clk);
  end

  always
    #5 Clk = ~Clk;

endmodule