module task_module;
    reg Clk, Reset, Load, Tx;
    reg[3:0] ParalelInput;
    wire[3:0] ParalelOutput;

    registerPIPO pipo(
        .Clk(Clk),
        .Reset(Reset),
        .Load(Load),
        .Tx(Tx),
        .ParalelInput(ParalelInput),
        .ParalelOutput(ParalelOutput));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        Clk = 0;
        Tx = 0;
        Reset = 1;
        ParalelInput = 4'b1010;
        Load = 1;
        #1 display();

        #1 Reset = 0;
        #1 display();
        
        repeat(10) begin
            #2 Load = 0;
            Tx = ~Tx;
            #1 display();

            #1 Load = 1;
        end;

        #20 $finish;
    end

    task display;
        $display("Clk: %b, Reset: %b, Load: %b, Tx: %b, ParalelInput: %b, ParalelOutput: %b", Clk, Reset, Load, Tx, ParalelInput, ParalelOutput);
    endtask
    always #1 Clk = ~Clk;
endmodule


