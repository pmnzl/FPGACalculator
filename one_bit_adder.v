// Use the following signal definitions:
// SW[0] = D0
// SW[1] = D1
// SW[2] = CIN
// LEDR[0] = SUM
// LEDR[1] = COUT

module oneBitAdder(SW, LEDR);
	input [2:0] SW;
	output [1:0] LEDR;
	
	assign LEDR[0] = (SW[2])^((SW[0])^(SW[1]));
	assign LEDR[1] = ((SW[2])&((SW[0])^(SW[1])))|((SW[0])&(SW[1]));
endmodule
