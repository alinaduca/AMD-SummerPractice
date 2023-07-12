
interface CalculatorBinarInterface;
    logic Clk;
    logic Reset;
    logic InputKey;
    logic ValidCmd;
    logic RWMem;
    logic [7:0] Addr;
    logic [7:0] InA;
    logic [7:0] InB;
    logic [3:0] Sel;
    logic ConfigDiv;
    logic [31:0] Din;
    logic Enable;

    logic [31:0] RezultatAlu;
    logic [31:0] RezultatConcat;
    logic [31:0] RezultatMux4;
    logic TxDone1, TxData1, SampleData1, Active1, Mode1;
    logic AccessMem1, RwMem2, ResetTmp;

    logic DOutValid;
    logic DataOut;
    logic ClkTx;
    logic CalcActive;
    logic [31:0] aux;
    logic CalcMode;
    logic [31:0] FrequencyDivTarget;

    modport DUT (
        input Clk,
        input Reset,
        input InputKey,
        input ValidCmd,
        input RWMem,
        input Addr,
        input InA,
        input InB,
        input Sel,
        input ConfigDiv,
        input Din,
        input Enable,
        output RezultatAlu,
        output RezultatConcat,
        output RezultatMux4,
        output TxDone1,
        output TxData1,
        output SampleData1,
        output Active1,
        output Mode1,
        output AccessMem1,
        output RwMem2,
        output ResetTmp,
        output DOutValid,
        output DataOut,
        output ClkTx,
        output CalcActive,
        output aux,
        output CalcMode,
        output FrequencyDivTarget
    );
endinterface
