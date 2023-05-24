// Use the following signal definitions:
// {SW[3], SW[2], SW[1], SW[0]} = D0
// {SW[7], SW[6], SW[5], SW[4]} = D1
// SW[8] = CIN
// {LEDR[3], LEDR[2], LEDR[1], LEDR[0]} = SUM
// LEDR[4] = COUT

module fourBitAdder(SW, LEDR);
	input [8:0] SW;
	output [4:0] LEDR;
	wire C0, C1, C2;

	adder U1(SW[0],SW[4],SW[8],LEDR[0],C0);
	adder U2(SW[1],SW[5],C0,LEDR[1],C1);
	adder U3(SW[2],SW[6],C1,LEDR[2],C2);
	adder U4(SW[3],SW[7],C2,LEDR[3],LEDR[4]);
endmodule


module adder(D0, D1, CIN, SUM, COUT);
	input D0, D1, CIN;
	output SUM, COUT;
	
	assign SUM = (CIN)^((D0)^(D1));
	assign COUT = ((CIN)&((D0)^(D1)))|((D0)&(D1));
endmodule
