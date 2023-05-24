module addSub(out, operandA, operandB, op_sel);
	input [3:0] operandA;
	input [3:0] operandB;
	input op_sel;
	output [3:0] out;
	
	//Adder/subtractor of two 4 bit values. Addition performed when op_sel = 1, subtract when op_sel = 0
	assign out = op_sel ? (operandA + operandB) : (operandA - operandB);
	
endmodule
