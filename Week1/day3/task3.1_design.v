module registerSISO #(parameter Width = 2)
                    (input Clk,
                    input Reset,
                    input SerialInput,
                    output SerialOutput);

    integer RegBankPos;
    reg [Width-1 : 0] RegBank;
    
    assign SerialOutput = RegBank[0];
    
    always @(posedge Clk, posedge Reset)
    begin
        if(Reset) begin
            for(RegBankPos = 0; RegBankPos < Width; RegBankPos = RegBankPos + 1) begin
                RegBank[RegBankPos] <= 1'b0;
            end
        end else if(Clk) begin
            RegBank <= { RegBank[Width - 2 : 0], SerialInput };
        end
    end
endmodule

module registerSIPO #(parameter Width = 2)
                    (input Clk,
                    input Reset,
                    input SerialInput,
                    output [Width-1 : 0] ParalelOutput);

    integer RegBankPos;
    integer i;
    reg [Width-1 : 0] RegBank;
    
    assign ParalelOutput = RegBank;
    
    always @(posedge Clk, posedge Reset)
    begin
        if(Reset) begin
            RegBank <= {Width{1'b0}};
        end else if(Clk) begin
            RegBank <= { RegBank[Width - 2 : 0], SerialInput };
        end
    end
endmodule

module registerPISO (input Clk,
                    input Reset,
                    input Load,
                    input Tx,
                    input [3 : 0] ParalelInput,
                    output SerialOutput);

    integer RegBankPos;
    reg [3 : 0] RegBank;
    
    assign SerialOutput = RegBank[3];

    always @(posedge Clk, posedge Reset)
    begin
        if(Reset) begin
            for(RegBankPos = 0; RegBankPos < 4; RegBankPos = RegBankPos + 1) begin
                RegBank[RegBankPos] <= 1'b0;
            end
        end else if(Clk)
        begin
            if(Load) begin
                RegBank<={RegBank[2:0], 1'b0};
            end else if(Tx) begin
                RegBank<=ParalelInput;
            end
        end
    end
endmodule

module registerPIPO (input Clk,
                    input Reset,
                    input Load,
                    input Tx,
                    input [3 : 0] ParalelInput,
                    output [3 : 0] ParalelOutput);

    integer RegBankPos;
    reg [3 : 0] RegBank;
    
    assign ParalelOutput = RegBank;
    
    always @(posedge Clk, posedge Reset)
    begin
        if(Reset) begin
            RegBank <= 4'b0000;
        end else if(Clk)
        begin
            if(Load) begin
                RegBank<=ParalelInput;
            end else if(Tx) begin
                RegBank<={RegBank[2:0], ParalelInput[3]};
            end
        end
    end
endmodule