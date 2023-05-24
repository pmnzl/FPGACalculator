module calcFSM(HEX0, HEX1, HEX2, HEX3, SW, KEY, clk);
	input [5:0] SW;
	input [3:0] KEY;
	input clk;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	
	wire [1:0] disp_sel;
	wire ld_a, ld_b, ld_op, ld_r, clear;
	
	calc_fsm fsm(.ld_a(ld_a), 
				.ld_b(ld_b), 
				.ld_op(ld_op), 
				.ld_r(ld_r), 
				.disp_sel(disp_sel), 
				.clear(clear), 
				.digit_in(KEY[0]), 
				.op_in(KEY[1]), 
				.execute_in(KEY[2]), 
				.reset(KEY[3]), 
				.clk(clk)
	);
	
	calc_datapath datapath(.HEX0(HEX0),
					.HEX1(HEX1), 
					.HEX2(HEX2), 
					.HEX3(HEX3), 
					.SW(SW), 
					.ld_a(ld_a), 
					.ld_b(ld_b), 
					.ld_op(ld_op), 
					.ld_r(ld_r), 
					.disp_sel(disp_sel), 
					.clear(clear),
					.clk(clk)
	);
	

endmodule
