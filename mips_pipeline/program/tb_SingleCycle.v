/*
	Title: MIPS Single Cycle CPU Testbench
	Author: Selene (Computer System and Architecture Lab, ICE, CYCU) 
*/
module tb_SingleCycle();
	reg clk, rst;
	
	// ????????10ns
	initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end

	initial begin
		rst = 1'b1;
		/*
			??????????"instr_mem.txt, data_mem.txt"?????
			????1 Byte??????????????
			??Little Endian??
		*/
		$readmemh("instr_mem.txt", CPU.InstrMem.mem_array );
		$display( "%h", CPU.InstrMem.mem_array[0] );
		$display( "%h", CPU.InstrMem.mem_array[1] );
		$display( "%h", CPU.InstrMem.mem_array[2] );
		$readmemh("data_mem.txt", CPU.DatMem.mem_array );
		// ????????????????????
		$readmemh("reg.txt", CPU.RegFile.file_array );
		#10;
		rst = 1'b0;
	end
	
	always @( posedge clk ) begin
		$display( "%d, PC: %d", $time/10-1, CPU.PC );
		$display( "opcode: %b", CPU.opcode );
		$display( "funct: %b", CPU.funct );
		if ( CPU.opcode == 6'd0 ) begin
			$display( "%d, wd: %d", $time/10-1, CPU.WB_WD );
			if ( CPU.funct == 6'd32 ) $display( "%d, ADD\n", $time/10-1 );
			else if ( CPU.funct == 6'd34 ) $display( "%d, SUB\n", $time/10-1 );
			else if ( CPU.funct == 6'd36 ) $display( "%d, AND\n", $time/10-1 );
			else if ( CPU.funct == 6'd37 ) $display( "%d, OR\n", $time/10-1 );
			else if ( CPU.funct == 6'd2 ) $display( "%d, SRL\n", $time/10-1 );
		end
		else if ( CPU.opcode == 6'd35 ) $display( "%d, LW\n", $time/10-1 );
		else if ( CPU.opcode == 6'd43 ) $display( "%d, SW\n", $time/10-1 );
		else if ( CPU.opcode == 6'd4 ) $display( "%d, BEQ\n", $time/10-1 );
		else if ( CPU.opcode == 6'd2 ) $display( "%d, J\n", $time/10-1 );
	end
	
	total_CPU CPU( clk, rst );
	
endmodule

