module taskCalculatorBinar;
    reg Clk, Reset, InputKey, ValidCmd, RWMem, ConfigDiv;
    reg [7:0] Addr, InA, InB;
    reg [31:0] Din;
    reg [3:0] Sel;
    wire [31:0] RezultatAlu, RezultatConcat, RezultatMux4;
    wire DOutputValid, DataOut, ClkTx, CalcActive, CalcMode;
    wire [31:0] aux;
    wire TxDone1, TxData1, SampleData1, Active1, Mode1;

    CalculatorBinar cb (
        .Clk(Clk),
        .Reset(Reset),
        .InputKey(InputKey),
        .ValidCmd(ValidCmd),
        .RWMem(RWMem),
        .Addr(Addr),
        .InA(InA),
        .InB(InB),
        .Sel(Sel),
        .ConfigDiv(ConfigDiv),
        .Din(Din),

        .RezultatAlu(RezultatAlu),
        .RezultatConcat(RezultatConcat),
        .RezultatMux4(RezultatMux4),
        .TxDone1(TxDone1), .TxData1(TxData1), .SampleData1(SampleData1), .Active1(Active1), .Mode1(Mode1),
        .AccessMem1(AccessMem1), .RwMem2(RwMem2),

        .DOutValid(DOutputValid),
        .DataOut(DataOut),
        .ClkTx(ClkTx),
        .CalcActive(CalcActive),
        .aux(aux),
        .CalcMode(CalcMode)
    );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);

    Reset=1;
    InA=8'b01010101;
    InB=8'b00101010;
    Addr=0;
    ConfigDiv=0;
    Sel=4'h1;
    Din=2;
    InputKey=1;
    Clk=0;
    ValidCmd=0;
    RWMem=1;
    #10 Reset=0;
    ValidCmd=1;
    #10 InputKey=0;
    // ConfigDiv=0;
    #10 InputKey=1;
    #10 InputKey=0;
    #10 InputKey=0;
    // ValidCmd=0;
    // #20 InputKey=0; 
    #10 ConfigDiv=0;
    ValidCmd=0; 

    #270 ValidCmd=1;
    InputKey=1;  

    $display;

    #50 $finish;
  end

  always begin
    #5 $display("Aux = %b",
                 aux);
  end

  always
    #5 Clk = ~Clk;

endmodule