
module taskSerialTransceiver;
  reg Clk, Reset, Enable, ConfigDiv;
  reg Sample, StartTx;
  reg [31:0] Din, DataIn;
  wire ClkOutput;
  wire TxBusy, Dout, TxDone;

  SerialTransceiver srt (
    .Clk(Clk),
    .ClkTx(ClkOutput),
    .Reset(Reset),
    .Sample(Sample),
    .StartTx(StartTx),
    .DataIn(DataIn),
    .TxBusy(TxBusy),
    .Dout(Dout),
    .TxDone(TxDone)
  );

  FrequencyDivider frd (
    .Clk(Clk),
    .Reset(Reset),
    .Enable(Enable),
    .ConfigDiv(ConfigDiv),
    .Din(Din),
    .ClkOutput(ClkOutput)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    //Exemplu de funcționare FrequencyDivider. DIV=2:
    DataIn=32'b101;
    Sample=0;
    Clk=0;
    StartTx=0;
    ConfigDiv=0;
    Reset=1;
    Enable=0;
    Din=0;
    #22 Reset=0;
    #51 Enable=1;
    #69 Enable=0;
    Din=2;
    ConfigDiv=1;
    #30 ConfigDiv=0;
    Din = 0;
    #47 Enable=1;
    Sample=1;
    #20 Sample=0;
    StartTx=1;
    #20 StartTx=0;


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