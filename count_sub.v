module count_sub(clk, rst_n,s_r1,s_r2, s_sub_r1, s_sub_r2);

input clk, rst_n;
input [5:0] s_r1 , s_r2;
output reg [5:0] s_sub_r1, s_sub_r2;

//control road 1
always@(posedge clk )
begin
	if(!rst_n)
		s_sub_r1 <= 0 ;
		
	else
		s_sub_r1 <= s_r1 - 1;
end

//control road 2

always@ (posedge clk)
begin
	if(!rst_n)
		s_sub_r2 <= 0 ;
		
	else
		s_sub_r2 <= s_r2 - 1;
end
endmodule
