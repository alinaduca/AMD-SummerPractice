module taskM1parametrized;
    reg [7:0] InA;
    reg Sel;
    wire [7:0] Out;

    Mux1 #(8) m1 (
        .InA(InA),
        .Sel(Sel),
        .Out(Out)
    );
    reg clk = 0;
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    InA = 8'h05;
    Sel = 0;

    // Display inputs
    $display("MUX1 Testbench");
    $display("--------------");
    $display("InA = %0b", InA);
    $display("Sel = %h", Sel);
    $display("");

    // Apply inputs and display outputs
    #10;
    $display("Out = %0b", Out);
    $display("");

    #10 $finish;
  end

  // Clock driver
  always #5 clk = ~clk;
endmodule