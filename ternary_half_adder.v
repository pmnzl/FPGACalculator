// Use the following signal definitions:
// {SW[1], SW[0]} = A
// {SW[3], SW[2]} = B
// {LEDR[1], LEDR[0]} = Sum
// LEDR[2] = Carry

module ternaryHalfAdder(SW, LEDR);
	input [3:0] SW;
	output [2:0] LEDR;
		
	assign LEDR[0] = (~SW[3] & ~SW[2] & SW[0]) | (~SW[1] & ~SW[0] & SW[2]) | (SW[1] & SW[3]);
	assign LEDR[1] = (SW[2] & SW[0]) | (SW[3] & ~SW[1] & ~SW[0]) | (SW[1] & ~SW[2] & ~SW[3]); 
	assign LEDR[2] = (SW[2] & SW[1]) | (SW[3] & SW[0]) | (SW[3] & SW[1]);
endmodule
	