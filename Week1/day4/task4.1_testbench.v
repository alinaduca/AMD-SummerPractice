module LIFO_Testbench;

  reg [1:0] Opcode;
  reg [31:0] Din;
  reg Reset;
  reg Clk;
  wire [31:0] Dout;
  wire LifoFull;
  wire LifoEmpty;
  wire Overflow;
  wire Underflow;

  LIFO lifo_inst (
    .Opcode(Opcode),
    .Din(Din),
    .Reset(Reset),
    .Clk(Clk),
    .Dout(Dout),
    .LifoFull(LifoFull),
    .LifoEmpty(LifoEmpty),
    .Overflow(Overflow),
    .Underflow(Underflow)
  );

  always #5 Clk = ~Clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    Clk = 0;
    Reset = 1;
    Opcode = 2'b11;
    Din = 0;
    #10 Reset = 0;

    Opcode = 2'b01;
    Din = 32'h12345678;
    #10;

    Opcode = 2'b01;
    Din = 32'h87654321;
    #10;

    Opcode = 2'b10;
    #10;

    Opcode = 2'b01;
    Din = 32'habcdef01;
    #10;

    Opcode = 2'b10;
    #10;

    Opcode = 2'b00;
    #10;

    $finish;
  end
  always @(posedge Clk) begin
    $display("[TIME=%t] Dout = %h, LifoFull = %b, LifoEmpty = %b, Overflow = %b, Underflow = %b",
             $time, Dout, LifoFull, LifoEmpty, Overflow, Underflow);
  end

endmodule