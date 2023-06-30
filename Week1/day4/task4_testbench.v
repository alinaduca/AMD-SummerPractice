module task4;
  reg [1:0] Opcode;
  reg [31:0] Din;
  reg Reset;
  reg Clk;
  wire [31:0] Dout;
  wire FifoFull;
  wire FifoEmpty;
  wire Overflow;
  wire Underflow;
  FIFO #(4) fifo_inst (
    .Opcode(Opcode),
    .Din(Din),
    .Reset(Reset),
    .Clk(Clk),
    .Dout(Dout),
    .FifoFull(FifoFull),
    .FifoEmpty(FifoEmpty),
    .Overflow(Overflow),
    .Underflow(Underflow)
  );
  always #5 Clk = ~Clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    Clk = 0;
    Reset = 1;
    Opcode = 2'b00; //Inactiv
    Din = 0;
    #10 Reset = 0;

    Opcode = 2'b01; //Push FIFO 
    Din = 32'h12345678;
    #10;

    Opcode = 2'b01; //Push FIFO
    Din = 32'h87654321;
    #10;

    Opcode = 2'b01; //Push FIFO
    Din = 32'habcdef01;
    #10;

    Opcode = 2'b01; //Push FIFO
    Din = 4'b1110;
    #10;

    Opcode = 2'b10; //Pop FIFO
    #10;

    Opcode = 2'b10; //Pop FIFO
    #10;

    Opcode = 2'b10; //Pop FIFO
    #10;

    Opcode = 2'b10; //Pop FIFO
    #10;

    Opcode = 2'b11; //Inactiv
    #10;

    $finish;
  end

  always @(posedge Clk) begin
    $display("[TIME=%t] Dout = %h, FifoFull = %b, FifoEmpty = %b, Overflow = %b, Underflow = %b",
             $time, Dout, FifoFull, FifoEmpty, Overflow, Underflow);
  end

endmodule