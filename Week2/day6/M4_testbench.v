module taskM4parametrized;
    reg [31:0] ConcatOut, Dout;
    reg CtrlModeTmp;
    wire [31:0] TxDinTmp;

    Mux4 #(32) m4(
        .ConcatOut(ConcatOut),
        .Dout(Dout),
        .CtrlModeTmp(CtrlModeTmp),
        .TxDinTmp(TxDinTmp)
    );
    reg clk = 0;
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    ConcatOut = 31'h00FF;
    Dout = 31'h0011;
    CtrlModeTmp = 1;


    // Display inputs
    $display("MUX4 Testbench");
    $display("--------------");
    $display("ConcatOut = %0b", ConcatOut);
    $display("Dout = %0b", Dout);
    $display("CtrlModeTmp = %0b", CtrlModeTmp);
    $display("");

    // Apply inputs and display outputs
    #10;
    $display("TxDinTmp = %0b", TxDinTmp);
    $display("");

    #10 $finish;
  end

  // Clock driver
  always #5 clk = ~clk;
endmodule