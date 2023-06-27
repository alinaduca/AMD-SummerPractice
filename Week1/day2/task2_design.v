// Code your design here
module CONCATENATE(InA, InB, InC, InD, InE, Out);
  input[0:7] InA, InB, InC;
  input[0:3] InD, InE;
  output[0:31] Out;
  assign Out = {InE, InD, InC, InB, InA};
endmodule