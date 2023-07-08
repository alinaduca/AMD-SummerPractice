module taskFrequencyDivider;
  reg Clk, Reset, Enable, ConfigDiv;
  reg [31:0] Din;
  wire ClkOutput;
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
    Clk=0;
    ConfigDiv=0;
    Reset=1;
    Enable=0;
    Din=0;
    #22 Reset=0;
    #51 Enable=1;
    #69 Enable=0;
    Din=5;
    ConfigDiv=1;
    #30 ConfigDiv=0;
    Din = 0;
    #47 Enable=1;


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