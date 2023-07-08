module Control_RW_Flow(
    input Clk,
    input Reset,
    input ValidCmd,
    input RW,
    input TxDone,
    input Active,
    input Mode,
    output reg AccessMem,
    output reg RWMem,
    output reg SampleData,
    output reg TxData,
    output reg Busy);

    localparam IDLE = 4'b0001;
    localparam S1   = 4'b0010;
    localparam S2   = 4'b0100;
    localparam S3   = 4'b1000;

    localparam S1w  = 4'b0011;

    localparam S1a  = 4'b0101;
    localparam S2a  = 4'b0110;
    localparam S3a  = 4'b1001;
    localparam S4a  = 4'b1010;

    reg [3:0] state;

    always @(posedge Clk, posedge Reset)
    begin
        if(Reset) begin
            state=IDLE;
            AccessMem=0;
            RWMem=0;
            SampleData=0;
            TxData=0;
            Busy=0;
        end
        else begin
            case(state)
                IDLE: begin
                    if(ValidCmd && Active) begin
                        if(Mode) begin
                            if(!RW) begin
                                RWMem=0;
                                state=S1;
                            end else begin
                                RWMem=1;
                                state=S1w;
                            end
                            AccessMem=1;
                            Busy=1;
                        end else begin
                            SampleData=1;
                            Busy=1;
                            state=S1a;
                        end
                    end
                end
                S1: begin
                    if(Active && Mode && !TxDone) begin
                        SampleData=1;
                        AccessMem=0;
                        Busy=1;
                        state=S2;
                    end
                end
                S2: begin
                    if(Active && !TxDone) begin
                        SampleData=0;
                        TxData=1;
                        state=S3;
                    end
                end
                S3: begin
                    if(Active && TxDone) begin
                        state=IDLE;
                        Busy=0;
                        TxData=0;
                        state=IDLE;
                    end
                end
                S1w: begin
                    AccessMem=0;
                    Busy=0;
                    RWMem=0;
                    state=IDLE;
                end
                S1a: begin
                    if(Active && !Mode && !TxDone) begin
                        TxData=1;
                        SampleData=0;
                        state=S2a;
                    end
                end
                S2a: begin
                    if(Active && TxDone) begin
                        Busy=0;
                        TxData=0;
                        state=IDLE;
                    end
                end
            endcase
        end
    end
endmodule