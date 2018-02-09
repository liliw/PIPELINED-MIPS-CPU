module Shifter( dataA, dataB, dataOut ) ;
  input [0:31] dataA, dataB ;
  output [31:0] dataOut ;
  wire [0:31] s0, s1, s2, s3, s4 ;
  
  assign s0[0] = (dataB[31] == 1) ? 0 : dataA[0] ;
  assign s0[1:31] = (dataB[31] == 1) ? dataA[0:30] : dataA[1:31] ; 
  
  assign s1[0:1] = (dataB[30] == 1) ? 0 : s0[0:1] ;
  assign s1[2:31] = (dataB[30] == 1) ? s0[0:29] : s0[2:31] ;
  
  assign s2[0:3] = (dataB[29] == 1) ? 0 : s1[0:3] ;
  assign s2[4:31] = (dataB[29] == 1) ? s1[0:27] : s1[4:31] ;
    
  assign s3[0:7] = (dataB[28] == 1) ? 0 : s2[0:7] ;
  assign s3[8:31] = (dataB[28] == 1) ? s2[0:23] : s2[8:31] ;
  
  assign s4[0:15] = (dataB[27] == 1) ? 0 : s3[0:15] ;
  assign s4[16:31] = (dataB[27] == 1) ? s3[0:15] : s3[16:31] ; 
    
  assign dataOut = ( dataB[26] == 1 ) ? 0 : s4 ;

endmodule

