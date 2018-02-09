module mux2( sel, dataA, dataB, dataOut );
  parameter bitwidth = 32;
  input sel;
  input  [bitwidth-1:0] dataA,dataB;
  output [bitwidth-1:0] dataOut;
  assign dataOut = sel ? dataB : dataA;
endmodule
