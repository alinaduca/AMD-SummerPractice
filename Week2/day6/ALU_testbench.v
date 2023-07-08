module taskALU;
  reg [7:0] operand_A;
  reg [7:0] operand_B;
  reg [3:0] Sel;
  wire [7:0] Out;
  wire [3:0] Flag;
  ALU uut (
    .operand_A(operand_A),
    .operand_B(operand_B),
    .Sel(Sel),
    .Out(Out),
    .Flag(Flag)
  );
  reg clk = 0;
  always #5 clk = ~clk;
  initial begin

    $dumpfile("dump.vcd");
    $dumpvars(1);
    operand_A = 8'hFF;
    operand_B = 8'hFF;
    Sel = 4'h2;

    // Display inputs
    $display("ALU Testbench");
    $display("--------------");
    $display("operand_A = %0b", operand_A);
    $display("operand_B = %0b", operand_B);
    // $display("ori = %0b", operand_A*operand_B);
    $display("Sel = %h", Sel);
    $display("");

    // Apply inputs and display outputs
    #10;
    $display("Out = %0b", Out);
    $display("Flag = %h", Flag);
    $display("");

    // // Repeat with different inputs
    // operand_A = 8'hFF;
    // operand_B = 8'h01;
    // Sel = 4'h1;

    // // Display inputs
    // $display("operand_A = %h", operand_A);
    // $display("operand_B = %h", operand_B);
    // $display("Sel = %h", Sel);
    // $display("");

    // // Apply inputs and display outputs
    // #10;
    // $display("Out = %h", Out);
    // $display("Flag = %h", Flag);

    // End simulation
    #10 $finish;
  end

  // Clock driver
  always #5 clk = ~clk;
endmodule