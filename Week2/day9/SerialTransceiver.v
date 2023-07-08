module SerialTransceiver #(parameter Width=32) (
    input Clk,
    input ClkTx,
    input Reset,
    input Sample,
    input StartTx,//=TxData
    input [Width-1:0] DataIn,
    output reg TxBusy,
    output reg Dout,
    output reg TxDone);

reg [Width-1:0] mem;
reg StartTransfer;

always @(posedge ClkTx, posedge Reset) begin
    if(Reset) begin
        TxBusy=0;
        mem=0;
        StartTransfer=0;
        Dout=0;
    end else begin
        if(StartTransfer) begin
            Dout = mem & 1;
            mem = mem >> 1;
            if(!mem) begin
                TxBusy=0;
                TxDone=1;
                StartTransfer=0;
            end
        end
        else
            Dout=1'bx;
    end
end

always @(posedge Clk, posedge Reset) begin
    if(Reset) begin
        TxBusy=0;
        mem=0;
    end else begin
        if(Sample) begin
            TxBusy=1;
            mem=DataIn;
        end
        if(StartTx) begin
            StartTransfer=1;
        end
    end
end

endmodule