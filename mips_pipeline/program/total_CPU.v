/*
	Li-Wei Li	
*/
module total_CPU( clk, reset );
  input reset, clk;
  wire [31:00] PC ;

 
  wire [05:00] funct, opcode ; 
  wire [31:00] IF_Instruction, IF_newInstruction, IF_PC, IF_BJ, IF_newPC;
  wire [31:00] IFID_Instruction, IFID_PC;
  wire ID_Regdst, ID_ALUsrc, ID_MemtoReg, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_Branch, ID_Jump;
  wire [01:00] ID_ALUOP;
  wire [04:00] ID_RN1, ID_RN2;
  wire [31:00] ID_RD1, ID_RD2, ID_EXTND, ID_CONCAT;
  wire  IDEX_Regdst, IDEX_ALUsrc, IDEX_MemtoReg, IDEX_RegWrite, IDEX_MemRead, IDEX_MemWrite, IDEX_Branch, IDEX_Jump, IDEX_Shift;
  reg  [01:00] IDEX_ALUOP;
  wire [04:00] IDEX_RT, IDEX_RD;
  wire [31:00] IDEX_Instruction, IDEX_RD1, IDEX_RD2, IDEX_PC, IDEX_EXTND, IDEX_CONCAT ;
  wire [02:00] EX_ALUOP;
  wire [04:00] EX_WN;
  wire [31:00] EX_ALUData2, EX_ALUResult, EX_PC, EX_ShiftResult, EX_Result;
  wire EX_Zero;
  wire [04:00] EXMEN_WN ;
  wire EXMEM_MemtoReg, EXMEM_RegWrite, EXMEM_MemRead, EXMEM_MemWrite, EXMEM_Branch, EXMEM_Jump, EXMEM_Zero;
  wire [31:00] EXMEN_Instruction, MEMWB_Instruction, EXMEN_RD2, EXMEN_Result, EXMEN_EXTND, EXMEN_PC, EXMEN_CONCAT ;
  wire MEM_PCSrc ;
  wire [31:00] MEM_RD;
  wire  MEMWB_MemtoReg, MEMWB_RegWrite, MEMWB_Jump;
  wire [04:00] MEMWB_WN;
  wire [31:00] MEMWB_ALUResult, MEMWB_RD ;
  wire [31:00] WB_WD;
  
  // ==============================
  
  always @( posedge clk ) begin
    if ( reset ) begin
      IDEX_ALUOP <= 2'b0;
    end
  end
  
  // ==============================IF================================
  

  memory InstrMem( clk, 1'b1, 1'b0, 32'd0, PC, IF_newInstruction );
  reg32 ins( clk, reset, 1'b1, IF_newInstruction, IF_Instruction ); // reg32 ( clk, rst, en_reg, d_in, d_out );
  add32 pcadd4( PC, 4, IF_PC );
  mux2 #(32) ifbramux( EX_PCSrc, IF_PC, EX_PC, IF_BJ );
  mux2 #(32) ifjmpmux( IDEX_Jump, IF_BJ, IDEX_CONCAT, IF_newPC );
  reg32 pc( clk, reset, 1'b1, IF_newPC, PC );
  
  // ==============================ID================================
  reg32 ifidpc( clk, reset, 1'b1, IF_PC, IFID_PC );
  reg32 ifidins( clk, reset, 1'b1, IF_Instruction, IFID_Instruction );
  assign ID_RN1 = IFID_Instruction[25:21];
  assign ID_RN2 = IFID_Instruction[20:16];
  control cu( IFID_Instruction[31:26], ID_Regdst, ID_ALUsrc, ID_MemtoReg, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_Branch, ID_Jump, ID_ALUOP );
  reg_file RegFile( clk, MEMWB_RegWrite, ID_RN1, ID_RN2, MEMWB_WN, WB_WD, ID_RD1, ID_RD2 );
  sign_extend tobig( IFID_Instruction[15:0], ID_EXTND );
  assign ID_CONCAT = {IFID_PC[31:28], IFID_Instruction[25:00], 2'b00};
  //==================================================
  always @( posedge clk ) begin
    IDEX_ALUOP <= ID_ALUOP;
  end
  //EX
  
	reg32 exr01( clk, reset, 1'b1, IFID_PC, IDEX_PC );
	reg32 exr02( clk, reset, 1'b1, ID_EXTND, IDEX_EXTND );
	reg32 exr03( clk, reset, 1'b1, ID_CONCAT, IDEX_CONCAT );
	reg32 exr04( clk, reset, 1'b1, IFID_Instruction, IDEX_Instruction );
	reg32 exr05( clk, reset, 1'b1, ID_RD1, IDEX_RD1 );
	reg32 exr06( clk, reset, 1'b1, ID_RD2, IDEX_RD2 );
	reg01 exr07( clk, reset, 1'b1, ID_Regdst, IDEX_Regdst );
	reg01 exr08( clk, reset, 1'b1, ID_ALUsrc, IDEX_ALUsrc );
	reg01 exr09( clk, reset, 1'b1, ID_MemtoReg, IDEX_MemtoReg );
	reg01 exr10( clk, reset, 1'b1, ID_MemRead, IDEX_MemRead );
	reg01 exr11( clk, reset, 1'b1, ID_MemWrite, IDEX_MemWrite );
	reg01 exr12( clk, reset, 1'b1, ID_RegWrite, IDEX_RegWrite );
	reg01 exr13( clk, reset, 1'b1, ID_Branch, IDEX_Branch );
	reg01 exr14( clk, reset, 1'b1, ID_Jump, IDEX_Jump );
	reg05 exr16( clk, reset, 1'b1, IFID_Instruction[20:16], IDEX_RT );
	reg05 exr17( clk, reset, 1'b1, IFID_Instruction[15:11], IDEX_RD );
  mux2 #(5)wn1( IDEX_Regdst, IDEX_RT, IDEX_RD, EX_WN );
  alu_ctl ac( IDEX_ALUOP, IDEX_EXTND[5:0], EX_ALUOP, IDEX_Shift );
  mux2 #(32)muxALUData2( IDEX_ALUsrc, IDEX_RD2, IDEX_EXTND, EX_ALUData2 );
  ALU totalAlu( EX_ALUOP, IDEX_RD1, EX_ALUData2, EX_ALUResult, EX_Zero );
  add32 exaddpc( IDEX_PC, { IDEX_EXTND[29:00], 2'b00 }, EX_PC );
  Shifter sss( IDEX_RD2, IDEX_EXTND[10:06], EX_ShiftResult );
  mux2 #(32)muxShiftAlu( IDEX_Shift, EX_ALUResult, EX_ShiftResult, EX_Result );
  assign EX_PCSrc = EX_Zero & IDEX_Branch ;
  //==================================================
  //MEM
	reg32 memr01( clk, reset, 1'b1, IDEX_Instruction, EXMEN_Instruction );
	reg32 memr02( clk, reset, 1'b1, IDEX_CONCAT, EXMEN_CONCAT );
	reg32 memr03( clk, reset, 1'b1, EX_PC, EXMEN_PC );
	reg32 memr04( clk, reset, 1'b1, EX_Result, EXMEN_Result );
	reg32 memr05( clk, reset, 1'b1, IDEX_RD2, EXMEN_RD2 );
	reg32 memr06( clk, reset, 1'b1, IDEX_EXTND, EXMEN_EXTND );
	reg01 memr07( clk, reset, 1'b1, IDEX_MemRead, EXMEM_MemRead );
	reg01 memr08( clk, reset, 1'b1, IDEX_MemWrite, EXMEM_MemWrite );
	reg01 memr09( clk, reset, 1'b1, IDEX_MemtoReg, EXMEM_MemtoReg );
	reg01 memr10( clk, reset, 1'b1, IDEX_RegWrite, EXMEM_RegWrite );
	reg01 memr11( clk, reset, 1'b1, IDEX_Branch, EXMEM_Branch );
	reg01 memr12( clk, reset, 1'b1, IDEX_Jump, EXMEM_Jump );
	reg01 memr13( clk, reset, 1'b1, EX_Zero, EXMEM_Zero );
	reg05 memr14( clk, reset, 1'b1, EX_WN, EXMEN_WN );
	memory DatMem( clk, EXMEM_MemRead, EXMEM_MemWrite, EXMEN_RD2, EXMEN_Result, MEM_RD );	   
  // assign MEM_PCSrc = EXMEM_Zero & EXMEM_Branch ;
  //==================================================
  //WB
	reg32 wbr1( clk, reset, 1'b1, IDEX_Instruction, MEMWB_Instruction );
	reg32 wbr2( clk, reset, 1'b1, MEM_RD, MEMWB_RD );
	reg32 wbr3( clk, reset, 1'b1, EXMEN_Result, MEMWB_ALUResult );
	reg01 wbr4( clk, reset, 1'b1, EXMEM_MemtoReg, MEMWB_MemtoReg );
	reg01 wbr5( clk, reset, 1'b1, EXMEM_RegWrite, MEMWB_RegWrite );
	reg01 wbr6( clk, reset, 1'b1, EXMEM_Jump, MEMWB_Jump );
	reg05 wbr7( clk, reset, 1'b1, EXMEN_WN, MEMWB_WN );
  mux2 #(32) wdmux( MEMWB_MemtoReg, MEMWB_ALUResult, MEMWB_RD, WB_WD );
  assign opcode = MEMWB_Instruction[31:26] ;
  assign funct = MEMWB_Instruction[5:0] ;
   
endmodule
