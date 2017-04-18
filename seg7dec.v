module seg7dec (in, out_hex);

input [3:0] in;
output reg [6:0] out_hex;

parameter 	num0 = 7'b1000000,
				num1 = 7'b1111001,
				num2 = 7'b0100100,
				num3 = 7'b0110000,
				num4 = 7'b0011001,
				num5 = 7'b0010010,
				num6 = 7'b0000010,
				num7 = 7'b1111000,
				num8 = 7'b0000000,
				num9 = 7'b0010000;
				
always @(in)
	begin
		case(in)
			0:out_hex<=num0;
			1:out_hex<=num1;
			2:out_hex<=num2;
			3:out_hex<=num3;
			4:out_hex<=num4;
			5:out_hex<=num5;
			6:out_hex<=num6;
			7:out_hex<=num7;
			8:out_hex<=num8;
			9:out_hex<=num9;
			default: out_hex<=num0;
		endcase
	end
endmodule
			