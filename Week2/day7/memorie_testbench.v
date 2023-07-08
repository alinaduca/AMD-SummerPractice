module taskMemory;
    reg Clk, Reset, Valid, R_W;
    reg [31:0] Din;
    reg [7:0] Addr;
    wire [31:0] Dout;
//DecInput și controller, tr, div
    Memory mem(
        .Clk(Clk),
        .Reset(Reset),
        .Valid(Valid),
        .R_W(R_W),
        .Addr(Addr),
        .Din(Din),
        .Dout(Dout)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        Clk = 0;
        Reset = 0;
        Valid = 1;
        Din = 8'hFF;
        Addr = 0;
        R_W = 1;

        #10;
        // Display inputs
        $display("Memory Testbench");
        $display("--------------");
        $display("Clk = %0b", Clk);
        $display("");

        // Apply inputs and display outputs
        #10;
        $display("Dout = %0b", Dout);
        $display("");
        // R_W = 0;

        // #10;
        // // Display inputs
        // $display("Memory Testbench");
        // $display("--------------");
        // $display("Clk = %0b", Clk);
        // $display("");

        // // Apply inputs and display outputs
        // #10;
        // $display("Dout = %0b", Dout);
        // $display("");

        //
        #10 Valid = 0;
        Addr = 8'h01;
        Din = 8'hAA;
        Valid = 1;

        #10 Valid = 0;
        Addr = 8'h00;
        R_W = 0;
        Valid = 1;

        #50 $finish;

    end

    always #5 Clk = ~Clk;
endmodule