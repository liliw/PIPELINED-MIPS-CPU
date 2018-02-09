module control( op, Regdst, ALUsrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOP ) ;
  input [05:00] op ;
  output Regdst, ALUsrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump; 
  output [01:00] ALUOP ;
  wire rt, lw, sw, beq, andi ;

  assign rt = ~( |( op ^ 6'b000000 ) ) ;  // compare op with 000000
  assign lw = ~( |( op ^ 6'b100011 ) ) ;  
  assign sw = ~( |( op ^ 6'b101011 ) ) ;  
  assign beq = ~( |( op ^ 6'b000100 ) ) ;  
  assign andi = ~( |( op ^ 6'b001100 ) ) ;  

  assign Regdst = rt ;
  assign ALUsrc = lw | sw | andi ;
  assign MemtoReg = lw ;
  assign RegWrite = rt | lw | andi ;
  assign MemRead = lw ;
  assign MemWrite = sw ;
  assign Branch = beq ;
  assign ALUOP[1] = rt | andi;
  assign ALUOP[0] = beq | andi;  
  assign Jump = ~( |( op ^ 6'b000010 ) ) ;  

endmodule
