module FrequencyDivider(
    input Clk,
    input Reset,
    input Enable,
    input ConfigDiv,
    input [31:0] Din,
    output reg ClkOutput
);

reg [31:0] FrequencyDivTarget;
reg [31:0] current;
reg [1:0] state;
reg [31:0] count0;
reg [31:0] count1;

always @(posedge Clk, posedge Reset)
begin
    if(Reset) begin
        ClkOutput=0;
        FrequencyDivTarget=1;
        current=0;
        state=0;
        count0=0;
        count1=0;
    end else begin
        if(!Enable) begin
            ClkOutput=0;
            if(ConfigDiv) begin
                FrequencyDivTarget = Din;
                current = 0;
            end
        end
    end
end

always @(posedge Clk, negedge Clk, posedge Enable) begin
    if(Enable) begin
        if(FrequencyDivTarget <= 1)
            ClkOutput = Clk;
        else begin
            if(FrequencyDivTarget & 32'b0001==1) begin
                if(state==1) begin
                    ClkOutput=1;
                    count1=count1+1;
                    if(count1==FrequencyDivTarget-1) begin
                        count1=0;
                        state=2;
                    end
                end else if(state==2) begin
                    ClkOutput=0;
                    count0=count0+1;
                    if(count0==FrequencyDivTarget+1) begin
                        count0=0;
                        state=1;
                    end
                end
            end else begin
                if(state==1) begin
                    ClkOutput=1;
                    count1=count1+1;
                    if(count1==FrequencyDivTarget) begin
                        count1=0;
                        state=2;
                    end
                end else if(state==2) begin
                    ClkOutput=0;
                    count0=count0+1;
                    if(count0==FrequencyDivTarget) begin
                        count0=0;
                        state=1;
                    end
                end
            end
        end
    end
end

always @(posedge Enable, negedge Enable) begin
    if(Enable)
        state=1;
    else
        state=0;
end

endmodule