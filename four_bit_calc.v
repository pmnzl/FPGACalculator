module calc(HEX0, SW, KEY, clk);
	input [8:0] SW;
	input [2:0] KEY;
	input clk;
	output [6:0] HEX0;
	
	//Calculator for adding or subtracting two 4 bit values
	//Wire Setup
	wire [3:0] A, B, R, S;
	
	//Reg_A
	register4bit Reg_A(A, SW[3:0], KEY[0], clk);
	//Reg_B
	register4bit Reg_B(B, SW[7:4], KEY[1], clk);
	//Add/Sub
	adderSubtractor addSub(S, A, B, SW[8]);
	//Reg_Out
	register4bit Reg_out(R, S, KEY[2], clk);
	//Decoder
	decoderHexTo7Segment decoder(HEX0, R);
	
endmodule


module register4bit(data_out, data_in, ld, clk);
	input [3:0] data_in;
	input ld;
	input clk;
	output reg [3:0] data_out;
	
	//4 bit register with sychronous enable triggered on clock's positive edge
	always @(posedge clk)
		if (ld)
			data_out = data_in;
			
endmodule


module decoderHexTo7Segment(seven_seg0, HEX);
	input [3:0] HEX;
	output [6:0] seven_seg0;
	
	//Hexadecimal -> 7-Segment Display Logic Converter
	/*a*/assign seven_seg0[0] = ~HEX[3]&~HEX[2]&~HEX[1]&HEX[0] | ~HEX[3]&HEX[2]&~HEX[1]&~HEX[0] | HEX[3]&~HEX[2]&HEX[1]&HEX[0] | HEX[3]&HEX[2]&~HEX[1]&HEX[0];
	/*b*/assign seven_seg0[1] = HEX[3]&HEX[2]&~HEX[0] | HEX[2]&HEX[1]&~HEX[0] | HEX[3]&HEX[1]&HEX[0] | ~HEX[3]&HEX[2]&~HEX[1]&HEX[0];
	/*c*/assign seven_seg0[2] = HEX[3]&HEX[2]&~HEX[0] | HEX[3]&HEX[2]&HEX[1] | ~HEX[3]&~HEX[2]&HEX[1]&~HEX[0];
	/*d*/assign seven_seg0[3] = ~HEX[3]&~HEX[2]&~HEX[1]&HEX[0] | ~HEX[3]&HEX[2]&~HEX[1]&~HEX[0] | HEX[3]&~HEX[2]&HEX[1]&~HEX[0] | HEX[2]&HEX[1]&HEX[0];
	/*e*/assign seven_seg0[4] = ~HEX[3]&HEX[0] | ~HEX[2]&~HEX[1]&HEX[0] | ~HEX[3]&HEX[2]&~HEX[1];
	/*f*/assign seven_seg0[5] = HEX[3]&HEX[2]&~HEX[1]&HEX[0] | ~HEX[3]&~HEX[2]&HEX[1] | ~HEX[3]&HEX[1]&HEX[0] | ~HEX[3]&~HEX[2]&HEX[0];
	/*g*/assign seven_seg0[6] = HEX[3]&HEX[2]&~HEX[1]&~HEX[0] | ~HEX[3]&HEX[2]&HEX[1]&HEX[0] | ~HEX[3]&~HEX[2]&~HEX[1];

endmodule


module adderSubtractor(out, operandA, operandB, op_sel);
	input [3:0] operandA;
	input [3:0] operandB;
	input op_sel;
	output [3:0] out;

	//Adder/subtractor. Addition performed when op_sel = 1, subtract when op_sel = 0
	assign out = op_sel ? (operandA + operandB) : (operandA - operandB);
	
endmodule
