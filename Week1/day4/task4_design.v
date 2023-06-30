module FIFO #(parameter Width = 2) (
  input [1:0] Opcode,
  input [31:0] Din,
  input Reset,
  input Clk,
  output [31:0] Dout,
  output FifoFull,
  output FifoEmpty,
  output Overflow,
  output Underflow);

  reg [31:0] memory[0 : Width-1];
  integer countAddr;
  reg [3:0] head;
  reg [3:0] tail;
  reg [3:0] next_tail;

  wire FifoFull = (next_tail == head) ? 1'b1 : 1'b0;
  wire FifoEmpty = (head == tail) ? 1'b1 : 1'b0;
  wire Overflow = (next_tail == head && Opcode == 2'b01) ? 1'b1 : 1'b0;
  wire Underflow = (head == tail && Opcode == 2'b10) ? 1'b1 : 1'b0;

  assign Dout = memory[tail];

  always @(posedge Clk, posedge Reset) begin //reset asincron, FIFO functioneaza pe posedge CLK
    if (Reset) begin
        for(countAddr = 0; countAddr < Width; countAddr = countAddr + 1) begin
            memory[countAddr] <= 32'h0;
        end
        head <= 4'b0000;
        tail <= 4'b0000;
        next_tail <= 4'b0001;
    end else
    begin
      if (Opcode == 2'b01) //Push
        memory[next_tail] <= Din;
      else if (Opcode == 2'b10) //Pop
        head <= head + 1;
    end
    tail <= next_tail;
  end

  always @(posedge Clk) begin
    if (Reset)
      next_tail <= 4'b0000;
    else
      next_tail <= (Opcode == 2'b01 && !FifoFull) ? (tail + 1) : tail;
  end

endmodule