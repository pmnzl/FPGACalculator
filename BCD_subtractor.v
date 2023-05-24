// Use the following signal definitions:
// {SW[7], SW[6], SW[5], SW[4]} = A
// {SW[3], SW[2], SW[1], SW[0]} = B
// {LEDR[3], LEDR[2], LEDR[1], LEDR[0]} = C

module main(SW, LEDR);
	input [7:0] SW;
	output [3:0] LEDR;
	wire COUT;
	wire [3:0]W;
	
	ninescomplement COMP(SW[3:0], W);
	bcdadder BCD(SW[7:4], W, 1, LEDR, COUT);
endmodule


module ninescomplement(B, X);
	input [3:0]B;
	output [3:0]X;
	
	assign X[3] = ~B[3]&~B[2]&~B[1];
	assign X[2] = B[2]^B[1];
	assign X[1] = B[1];
	assign X[0] = ~B[0];
endmodule


module bcdadder(A, B, CIN, F, COUT);
	input [3:0] A, B;
	input CIN;
	output [3:0] F;
	output COUT;
	wire [3:0] Z, S;
	wire C, K, COUT;
	
	adder4bit A0(A, B, CIN, Z, K);
	assign C = K|(Z[3]&Z[2])|(Z[3]&Z[1]);
	assign S = {1'b0, C, C, 1'b0};
	adder4bit A1(Z, S, 0, F, COUT);
endmodule


module adder4bit(A, B, CIN, SUM, COUT);
	input [3:0] A, B;
	input CIN;
	output [3:0] SUM;
	output COUT;
	wire C1, C2, C3;
	
	fulladder S1(A[0], B[0], CIN, SUM[0], C1);
	fulladder S2(A[1], B[1], C1, SUM[1], C2);
	fulladder S3(A[2], B[2], C2, SUM[2], C3);
	fulladder S4(A[3], B[3], C3, SUM[3], COUT);
endmodule


module fulladder(A, B, CIN, SUM, COUT);
	input A, B, CIN;
	output SUM, COUT;
	
	assign SUM = (CIN)^((A)^(B));
	assign COUT = ((CIN)&((A)^(B)))|((A)&(B));
endmodule
