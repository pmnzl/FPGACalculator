module sevenSeg(seven_seg0, HEX);
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
