module sign_extend( dataIN, dataOUT );
  input [15:0] dataIN;
  output [31:0] dataOUT;
  assign dataOUT[15:0] = dataIN;
  assign dataOUT[16] = dataIN[15];
  assign dataOUT[17] = dataIN[15];
  assign dataOUT[18] = dataIN[15];
  assign dataOUT[19] = dataIN[15];
  assign dataOUT[20] = dataIN[15];
  assign dataOUT[21] = dataIN[15];
  assign dataOUT[22] = dataIN[15];
  assign dataOUT[23] = dataIN[15];
  assign dataOUT[24] = dataIN[15];
  assign dataOUT[25] = dataIN[15];
  assign dataOUT[26] = dataIN[15];
  assign dataOUT[27] = dataIN[15];
  assign dataOUT[28] = dataIN[15];
  assign dataOUT[29] = dataIN[15];
  assign dataOUT[30] = dataIN[15];
  assign dataOUT[31] = dataIN[15];
endmodule