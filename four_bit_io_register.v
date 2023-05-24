module ioReg(data_out, data_in, ld, clk);
	input [3:0] data_in;
	input ld;
	input clk;
	output reg [3:0] data_out;
	
	//4 bit register with sychronous enable triggered on clock's positive edge
	always @(posedge clk)
		if (ld)
			data_out = data_in;
			
endmodule
