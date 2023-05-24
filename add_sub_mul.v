module addSubMul(out, operandA, operandB, op_sel);
	input [7:0] operandA;
	input [7:0] operandB;
	input [1:0] op_sel;
	output [15:0] out;
	
	//Reg and wire setup
	//Reg for 4, 4 bit outputs
	reg [15:0] outBin1000;
	reg [15:0] outBin100;
	reg [15:0] outBin10;
	reg [15:0] outBin1;
	
	//Result reg
	reg [15:0] res;
	
	//Operand regs
	wire [7:0] opA, opB;
	
	//Convert BCD to Decimal.
	assign opA = operandA[7:4]*8'd10 + operandA[3:0];
	assign opB = operandB[7:4]*8'd10 + operandB[3:0];
	
	//Asynchronous arithmetic unit.
	always @(*)
	begin
		case (op_sel)
			1	:	res = opA + opB;	//Addition
			2	:	res = opA - opB;	//Subtraction
			3	:	res = opA * opB;	//Multiplication
			0	: 	res = 0;				//Error State
		endcase
		
		//Split results into place value digits.
		outBin1000 = (res%16'd10000-res%16'd1000)/16'd1000;	//1000s
		outBin100 = (res%16'd1000-res%16'd100)/16'd100;			//100s
		outBin10 = (res%16'd100-res%16'd10)/16'd10;				//10s
		outBin1 = res%16'd10;											//1s
	end
	
	//Truncate 16 bit results to 4 bit outputs.
	assign out[15:12] = outBin1000[3:0];
	assign out[11:8] = outBin100[3:0];
	assign out[7:4] = outBin10[3:0];
	assign out[3:0] = outBin1[3:0];
	
endmodule
