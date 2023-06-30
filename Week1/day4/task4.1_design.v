module LIFO (
  input [1:0] Opcode,
  input [31:0] Din,
  input Reset,
  input Clk,
  output [31:0] Dout,
  output LifoFull,
  output LifoEmpty,
  output Overflow,
  output Underflow
);

  reg [31:0] memory [0:7];
  reg [2:0] top;
  reg [2:0] next_top;

  wire LifoFull = (next_top == 0) ? 1'b1 : 1'b0;
  wire LifoEmpty = (top == 0) ? 1'b1 : 1'b0;
  wire Overflow = (next_top == 0 && Opcode == 2'b01) ? 1'b1 : 1'b0;
  wire Underflow = (top == 0 && Opcode == 2'b10) ? 1'b1 : 1'b0;

  assign Dout = memory[top];

  always @(posedge Clk) begin
    if (Reset) begin
      top <= 3'b000;
    end else begin
      if (Opcode == 2'b01)
        memory[next_top] <= Din;
      else if (Opcode == 2'b10)
        top <= top - 1;
      else if (Opcode == 2'b00)
        top <= top;
    end
    next_top <= (Opcode == 2'b01 && !LifoFull) ? (top + 1) : top;
  end

endmodule