module alu_ctl( CUToALU, funct, ALU_OP, Shift );
  input [01:00] CUToALU ;
  input [05:00] funct ;
  output [02:00] ALU_OP;
  output Shift;
  assign ALU_OP[0] = (CUToALU[1] & ( funct[0] | funct[3] ) ) & ~(&CUToALU);
  assign ALU_OP[1] = (~CUToALU[1] | ~funct[2] ) & ~(&CUToALU);
  assign ALU_OP[2] = (( CUToALU[1] & funct[1] ) | CUToALU[0] ) & ~(&CUToALU);
  assign Shift = CUToALU[1] & ( ~ CUToALU[0] ) & (~(|(funct ^ 6'b000010)));
endmodule
