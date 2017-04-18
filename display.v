module display(clk, s_ch1, s_dv1, s_ch2, s_dv2, seg7_road1_ch,seg7_road1_dv,seg7_road2_ch,seg7_road2_dv );

input clk;
input [4:0] s_ch1, s_dv1, s_ch2, s_dv2;

output reg [6:0] seg7_road1_ch,seg7_road1_dv,seg7_road2_ch,seg7_road2_dv;

wire [6:0] r1_ch_tmp;
wire [6:0] r1_dv_tmp;
wire [6:0] r2_ch_tmp;
wire [6:0] r2_dv_tmp;

parameter num_ = 7'b0111111;

seg7dec r1_ch_dec(.in(s_ch1), .out_hex(r1_ch_tmp));
seg7dec r1_dv_dec(.in(s_dv1), .out_hex(r1_dv_tmp));
seg7dec r2_ch_dec(.in(s_ch2), .out_hex(r2_ch_tmp));
seg7dec r2_dv_dec(.in(s_dv2), .out_hex(r2_dv_tmp));


always @ (posedge clk)     //display control
	begin
		
		seg7_road1_ch <= r1_ch_tmp;
		seg7_road1_dv <= r1_dv_tmp;
		seg7_road2_ch <= r2_ch_tmp;
		seg7_road2_dv <= r2_dv_tmp;
		
	end
endmodule	