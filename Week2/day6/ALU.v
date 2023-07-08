module ALU (
    input [7:0] operand_A, operand_B,
    input [3:0] Sel,
    output [7:0] Out,
    output [3:0] Flag);

    reg [7:0] Result;
    reg [8:0] extendResult;
    reg [15:0] extendResult1;
    reg [3:0] FlagCpy;
    wire [8:0] tmp;

    assign Out = Result;
    assign Flag = FlagCpy;
    always @(*)
    begin
        case(Sel)
            4'h0:
                begin
                    extendResult = operand_A + operand_B;
                    if(extendResult >> 8 == 1)
                        FlagCpy = FlagCpy | 4'b0010;
                    else
                        Result = extendResult;
                end
            4'h1:
                begin
                    if(operand_A < operand_B)
                        FlagCpy = FlagCpy | 4'b1000;
                    else
                        Result = operand_A - operand_B;
                end
            4'h2:
                begin
                    extendResult1 = operand_A * operand_B;
                    if(extendResult1 >> 8 != 0)
                        FlagCpy = FlagCpy | 4'b0100;
                    else
                        Result = operand_A * operand_B;
                    if(Result == 0)
                        FlagCpy = FlagCpy | 4'b0001;                        
                end
            4'h3:
                begin
                    if(operand_A < operand_B)
                        FlagCpy = FlagCpy | 4'b1000;
                    else
                        Result = operand_A / operand_B;
                    if(Result == 0)
                        FlagCpy = FlagCpy | 4'b0001;
                end
            4'h4:
                begin
                extendResult1 = operand_A << operand_B;
                if(operand_B > 8 || (operand_A==1&&operand_B==8))
                    FlagCpy = FlagCpy | 4'b0010;
                else
                    begin
                    extendResult1 = operand_A << operand_B;
                    if(extendResult1 << 8 != 0)
                        FlagCpy = FlagCpy | 4'b0010;
                    else
                        Result = operand_A << operand_B;
                    end
                if(Result == 0)
                    FlagCpy = FlagCpy | 4'b0001;
                end
            4'h5:
                begin
                Result = operand_A >> operand_B;
                if(Result == 0)
                    FlagCpy = FlagCpy | 4'b0001;
                if(operand_B > 8 || (operand_B == 8 && operand_A==1) || (operand_B==7&&(operand_A == 2 || operand_A==3)) || operand_B==6&&(operand_A<=7&&operand_A>=4) || operand_B==5&&(operand_A<=15&&operand_A>=8) || operand_B==4&&(operand_A<=31&&operand_A>=16))
                    FlagCpy = FlagCpy | 4'b1000;
                end
            4'h6:
                begin
                Result = operand_A & operand_B;
                if(Result == 0)
                    FlagCpy = FlagCpy | 1;
                end
            4'h7:
                begin
                Result = operand_A | operand_B;
                if(Result == 0)
                    FlagCpy = FlagCpy | 1;
                end
            4'h8:
                begin
                Result = operand_A ^ operand_B;
                if(Result == 0)
                    FlagCpy = FlagCpy | 1;
                end
            4'h9:
                begin
                Result = ~(operand_A ^ operand_B);
                if(Result == 0)
                    FlagCpy = FlagCpy | 1;
                end
            4'hA:
                begin
                Result = ~(operand_A & operand_B);
                if(Result == 0)
                    FlagCpy = FlagCpy | 1;
                end
            4'hB:
                begin
                Result = ~(operand_A | operand_B);
                if(Result == 0)
                    FlagCpy = FlagCpy | 1;
                end
            default:
                Result = 8'bzzzzzzzz;
        endcase
    end
    initial begin
        FlagCpy = 4'b0000;
        Result = 8'h00;
    end
endmodule