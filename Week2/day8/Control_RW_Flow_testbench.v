`include "DecInputKey.v"
module taskController;
  reg Clk, Reset, ValidCmd, InputKey;
  reg RW, TxDone;
  wire Active, Mode;
  wire AccessMem, RWMem, SampleData, TxData, Busy;

  DecInputKey dec (
    .Clk(Clk),
    .Reset(Reset),
    .ValidCmd(ValidCmd),
    .InputKey(InputKey),
    .Active(Active),
    .Mode(Mode)
  );

  Control_RW_Flow control (
    .Clk(Clk),
    .Reset(Reset),
    .ValidCmd(ValidCmd),
    .RW(RW),
    .TxDone(TxDone),
    .Active(Active),
    .Mode(Mode),
    .AccessMem(AccessMem),
    .RWMem(RWMem),
    .SampleData(SampleData),
    .TxData(TxData),
    .Busy(Busy)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    //Exemplu de funcționare Control RW Flow. READ din memorie:
    // Clk = 0;
    // ValidCmd=0;
    // Reset=1;
    // InputKey = 0;
    // RW=0;
    // TxDone=0;
    // #10
    // ValidCmd = 1;
    // Reset = 0;
    // InputKey = 1;
    // #10 InputKey = 0;
    // #10 InputKey = 1;
    // #10 InputKey = 0;
    // #10 InputKey = 1;
    // #20 ValidCmd = 0;
    // #70 TxDone=1;
    // #15 TxDone=0;



    //Exemplu de funcționare Control RW Flow. WRITE în memorie:
    // Clk = 0;
    // ValidCmd=0;
    // Reset=1;
    // InputKey = 0;
    // RW=0;
    // TxDone=0;
    // #10
    // ValidCmd = 1;
    // Reset = 0;
    // InputKey = 1;
    // #10 InputKey = 0;
    // #10 InputKey = 1;
    // #10 InputKey = 0;
    // #10 InputKey = 0;
    // #20 ValidCmd = 0;
    // #50 InputKey = 1;
    // RW=1;
    // ValidCmd=1;
    // #20 RW=0;
    // ValidCmd=0;



    //Exemplu de funcționare Control RW Flow. MODE = 0:
    Clk = 0;
    ValidCmd=0;
    Reset=1;
    InputKey = 0;
    RW=0;
    TxDone=0;
    #10
    ValidCmd = 1;
    Reset = 0;
    InputKey = 1;
    #10 InputKey = 0;
    #10 InputKey = 1;
    #10 InputKey = 0;
    #10 InputKey = 0;
    #20 ValidCmd = 0;
    #70 TxDone=1;
    #20 TxDone=0;


    $display;

    #200 $finish;
  end

  always begin
    #1 $display("Clk = %b",
                 Clk);
  end

  always
    #5 Clk = ~Clk;

endmodule