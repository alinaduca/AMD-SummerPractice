module taskDecInputKey;
  reg Clk, Reset, ValidCmd, InputKey;
  wire Active, Mode;
  DecInputKey dec (
    .Clk(Clk),
    .Reset(Reset),
    .ValidCmd(ValidCmd),
    .InputKey(InputKey),
    .Active(Active),
    .Mode(Mode)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    //Exemplu de funcționare DecInputKey. MODE = 1:
    Clk = 0;
    ValidCmd=0;
    Reset=1;
    InputKey = 0;
    #10
    ValidCmd = 1;
    Reset = 0;
     InputKey = 1;
    #10 InputKey = 0;
    #10 InputKey = 1;
    #10 InputKey = 0;
    #10 InputKey = 1;
    #10 InputKey = 0;
    ValidCmd = 0;




    //Exemplu de funcționare DecInputKey. MODE = 0:
    #30 Reset = 1;
    #10 Reset = 0;
    InputKey = 1;
    ValidCmd = 1;

    #10 InputKey = 0;
    #10 InputKey = 1;
    #10 InputKey = 0;

    #20 ValidCmd = 0;




    $display;

    #100 $finish;
  end

  always begin
    #1 $display("Clk = %b",
                 Clk);
  end

  always
    #5 Clk = ~Clk;

endmodule