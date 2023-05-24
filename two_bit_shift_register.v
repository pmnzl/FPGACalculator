module shiftReg(data_out, data_in, en, clk);
	input [3:0] data_in;
	input en;
	input clk;
	output reg [7:0] data_out;
	
	//Positive edge trigger.
	always @(posedge clk)
		//2 digit BCD register with sychronous enable
		if (en)
		begin
			data_out[7:4] = data_out[3:0];	//2nd BCD Digit from the 1st BCD digit from last enabled clock cycle
			data_out[3:0] = data_in[3:0];		//New BCD Digit from input
		end
endmodule
