module bitALU( dataA, dataB, Signal, dataOut, cin, cout );

  input dataA, dataB, cin;
  input [2:0]Signal;
  output dataOut;
  output cout;

  parameter AND = 3'b000;
  parameter OR  = 3'b001;
  parameter ADD = 3'b010;
  parameter SUB = 3'b110;
  parameter SLT = 3'b111;

  wire isAND, isOR, isADD_SUB, isSUB;
  wire ansAND, ansOR, ansADD_SUB;
  wire tempDataB;
  assign isAND = ~(|(AND^Signal));
  assign isOR = ~(|(OR^Signal));
  assign isSUB = ~(|(SUB^Signal)) | ~(|(SLT^Signal));
  assign isADD_SUB = ~(|(ADD^Signal)) | isSUB ;
  assign tempDataB = dataB ^ isSUB; // ??? dataB
  
  assign ansAND = ( dataA & dataB );
  assign ansOR = ( dataA | dataB );
  assign ansADD_SUB = dataA ^ tempDataB ^ cin; // ??? ? ? ??
  assign cout = isADD_SUB & ( ( ( dataA | tempDataB ) & cin ) | ( dataA & tempDataB ) ); // ??? ? ? ??
  
  assign dataOut = ( ( isAND & ansAND  ) | ( isOR & ansOR ) | ( isADD_SUB & ansADD_SUB ) );
  
  
endmodule

