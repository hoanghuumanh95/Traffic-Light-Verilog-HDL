module div_clk(clk_50M, clk);
input clk_50M;
output reg clk;
reg [25:0] cnt;
always@(posedge clk_50M)
	begin
		if(cnt == 24999999)
			begin
				cnt = 0;
				clk = ! clk;
			end
		else
			cnt = cnt + 1;
	end
endmodule	