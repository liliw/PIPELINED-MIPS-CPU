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
module reg05 ( clk, rst, en_reg, d_in, d_out );
  input clk, rst, en_reg;
  input[04:0]	d_in;
  output[04:0] d_out;
  reg [04:0] d_out;
 
  always @( posedge clk ) begin
    if ( rst )
      d_out <= 5'b0;
    else if ( en_reg )
      d_out <= d_in;
  end

endmodule
	

