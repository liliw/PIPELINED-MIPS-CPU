/*
	Title: 32-Bit Register with Synchronous Reset
	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. clk
		2. rst: ????
		3. en_reg: ??????????
		4. d_in: ?????????
	Output Port
		1. d_out: ?????????
*/
module reg01 ( clk, rst, en_reg, d_in, d_out );
  input clk, rst, en_reg;
  input	d_in;
  output d_out;
  reg  d_out;
 
  always @( posedge clk ) begin
    if ( rst )
      d_out <= 1'b0;
    else if ( en_reg )
      d_out <= d_in;
  end

endmodule
	

