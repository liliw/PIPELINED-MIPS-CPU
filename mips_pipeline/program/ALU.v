module ALU( Signal, dataA, dataB, dataOut, zero );
input [31:0] dataA ;
input [31:0] dataB ;
input [2:0] Signal ;
output [31:0] dataOut ;
output zero;
parameter AND = 3'b000;
parameter OR  = 3'b001;
parameter ADD = 3'b010;
parameter SUB = 3'b110;
parameter SLT = 3'b111;
/*
??????
*/

/*
=====================================================
???
=====================================================
*/

  wire isSUB, isSLT;
  wire [31:0] carry;
  wire [31:0] tempOut;
  wire ASmallerB;
  assign isSUB = ~(|(SUB^Signal));
  assign isSLT = ~(|(SLT^Signal));
  assign zero = ~(| tempOut);
  bitALU bA00( dataA[00], dataB[00], Signal, tempOut[00], (isSUB | isSLT), carry[00] );
  bitALU bA01( dataA[01], dataB[01], Signal, tempOut[01], carry[00], carry[01] );
  bitALU bA02( dataA[02], dataB[02], Signal, tempOut[02], carry[01], carry[02] );
  bitALU bA03( dataA[03], dataB[03], Signal, tempOut[03], carry[02], carry[03] );
  bitALU bA04( dataA[04], dataB[04], Signal, tempOut[04], carry[03], carry[04] );
  bitALU bA05( dataA[05], dataB[05], Signal, tempOut[05], carry[04], carry[05] );
  bitALU bA06( dataA[06], dataB[06], Signal, tempOut[06], carry[05], carry[06] );
  bitALU bA07( dataA[07], dataB[07], Signal, tempOut[07], carry[06], carry[07] );
  bitALU bA08( dataA[08], dataB[08], Signal, tempOut[08], carry[07], carry[08] );
  bitALU bA09( dataA[09], dataB[09], Signal, tempOut[09], carry[08], carry[09] );
  bitALU bA10( dataA[10], dataB[10], Signal, tempOut[10], carry[09], carry[10] );
  bitALU bA11( dataA[11], dataB[11], Signal, tempOut[11], carry[10], carry[11] );
  bitALU bA12( dataA[12], dataB[12], Signal, tempOut[12], carry[11], carry[12] );
  bitALU bA13( dataA[13], dataB[13], Signal, tempOut[13], carry[12], carry[13] );
  bitALU bA14( dataA[14], dataB[14], Signal, tempOut[14], carry[13], carry[14] );
  bitALU bA15( dataA[15], dataB[15], Signal, tempOut[15], carry[14], carry[15] );
  bitALU bA16( dataA[16], dataB[16], Signal, tempOut[16], carry[15], carry[16] );
  bitALU bA17( dataA[17], dataB[17], Signal, tempOut[17], carry[16], carry[17] );
  bitALU bA18( dataA[18], dataB[18], Signal, tempOut[18], carry[17], carry[18] );
  bitALU bA19( dataA[19], dataB[19], Signal, tempOut[19], carry[18], carry[19] );
  bitALU bA20( dataA[20], dataB[20], Signal, tempOut[20], carry[19], carry[20] );
  bitALU bA21( dataA[21], dataB[21], Signal, tempOut[21], carry[20], carry[21] );
  bitALU bA22( dataA[22], dataB[22], Signal, tempOut[22], carry[21], carry[22] );
  bitALU bA23( dataA[23], dataB[23], Signal, tempOut[23], carry[22], carry[23] );
  bitALU bA24( dataA[24], dataB[24], Signal, tempOut[24], carry[23], carry[24] );
  bitALU bA25( dataA[25], dataB[25], Signal, tempOut[25], carry[24], carry[25] );
  bitALU bA26( dataA[26], dataB[26], Signal, tempOut[26], carry[25], carry[26] );
  bitALU bA27( dataA[27], dataB[27], Signal, tempOut[27], carry[26], carry[27] );
  bitALU bA28( dataA[28], dataB[28], Signal, tempOut[28], carry[27], carry[28] );
  bitALU bA29( dataA[29], dataB[29], Signal, tempOut[29], carry[28], carry[29] );
  bitALU bA30( dataA[30], dataB[30], Signal, tempOut[30], carry[29], carry[30] );
  bitALU bA31( dataA[31], dataB[31], Signal, tempOut[31], carry[30], carry[31] );
  assign ASmallerB = ~carry[31];
  assign dataOut[00] = ( (tempOut[00] & ~isSLT) | (isSLT & ASmallerB) ) ; // 
  assign dataOut[01] = ( tempOut[01] & ~isSLT ); 
  assign dataOut[02] = ( tempOut[02] & ~isSLT );
  assign dataOut[03] = ( tempOut[03] & ~isSLT );
  assign dataOut[04] = ( tempOut[04] & ~isSLT );
  assign dataOut[05] = ( tempOut[05] & ~isSLT );
  assign dataOut[06] = ( tempOut[06] & ~isSLT );
  assign dataOut[07] = ( tempOut[07] & ~isSLT );
  assign dataOut[08] = ( tempOut[08] & ~isSLT );
  assign dataOut[09] = ( tempOut[09] & ~isSLT );
  assign dataOut[10] = ( tempOut[10] & ~isSLT );
  assign dataOut[11] = ( tempOut[11] & ~isSLT );
  assign dataOut[12] = ( tempOut[12] & ~isSLT );
  assign dataOut[13] = ( tempOut[13] & ~isSLT );
  assign dataOut[14] = ( tempOut[14] & ~isSLT );
  assign dataOut[15] = ( tempOut[15] & ~isSLT );
  assign dataOut[16] = ( tempOut[16] & ~isSLT );
  assign dataOut[17] = ( tempOut[17] & ~isSLT );
  assign dataOut[18] = ( tempOut[18] & ~isSLT );
  assign dataOut[19] = ( tempOut[19] & ~isSLT );
  assign dataOut[20] = ( tempOut[20] & ~isSLT );
  assign dataOut[21] = ( tempOut[21] & ~isSLT );
  assign dataOut[22] = ( tempOut[22] & ~isSLT );
  assign dataOut[23] = ( tempOut[23] & ~isSLT );
  assign dataOut[24] = ( tempOut[24] & ~isSLT );
  assign dataOut[25] = ( tempOut[25] & ~isSLT );
  assign dataOut[26] = ( tempOut[26] & ~isSLT );
  assign dataOut[27] = ( tempOut[27] & ~isSLT );
  assign dataOut[28] = ( tempOut[28] & ~isSLT );
  assign dataOut[29] = ( tempOut[29] & ~isSLT );
  assign dataOut[30] = ( tempOut[30] & ~isSLT );
  assign dataOut[31] = ( tempOut[31] & ~isSLT );

/*
????case???????
????????signal???????
???????
*/
/*
=====================================================
??????????????????????????
=====================================================
*/

endmodule
