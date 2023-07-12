`include "interface.sv"
module testbench_interface;
    CalculatorBinarInterface intf();

    CalculatorBinar dut (
        .Clk(intf.Clk),
        .Reset(intf.Reset),
        .InputKey(intf.InputKey),
        .ValidCmd(intf.ValidCmd),
        .RWMem(intf.RWMem),
        .Addr(intf.Addr),
        .InA(intf.InA),
        .InB(intf.InB),
        .Sel(intf.Sel),
        .ConfigDiv(intf.ConfigDiv),
        .Din(intf.Din),
        .Enable(intf.Enable),

        .RezultatAlu(intf.RezultatAlu),
        .RezultatConcat(intf.RezultatConcat),
        .RezultatMux4(intf.RezultatMux4),
        .TxDone1(intf.TxDone1), .TxData1(intf.TxData1), .SampleData1(intf.SampleData1), .Active1(intf.Active1), .Mode1(intf.Mode1),
        .AccessMem1(intf.AccessMem1), .RwMem2(intf.RwMem2),
        .ResetTmp(intf.ResetTmp),

        .DOutValid(intf.DOutValid),
        .ClkTx(intf.ClkTx),
        .DataOut(intf.DataOut),
        .CalcActive(intf.CalcActive),
        .aux(intf.aux),
        .CalcMode(intf.CalcMode),
        .FrequencyDivTarget(intf.FrequencyDivTarget)
    );
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, dut);
    intf.Reset=1;
    intf.Enable=0;
    intf.InA=8'b01010101;
    intf.InB=8'b00101010;
    intf.Addr=0;
    intf.ConfigDiv=0;
    intf.Sel=4'h1;
    intf.Din=0;
    intf.InputKey=1;
    intf.Clk=0;
    intf.ValidCmd=0;
    intf.RWMem=1;
    #10 intf.Reset=0;
    intf.ConfigDiv=1;
    intf.ValidCmd=1;
    intf.Din=2;
    #10 intf.InputKey=0;
    intf.Din=0;
    intf.ConfigDiv=0;
    #10 intf.InputKey=1;
    #10 intf.InputKey=0;
    intf.Enable=1;
    #10 intf.InputKey=1;
    #10 intf.ConfigDiv=0;  
    // #10 InputKey=0;
    #10 intf.RWMem=0;

    $display;

    #300 $finish;
    
  end
   always
    #5 intf.Clk = ~intf.Clk;
endmodule