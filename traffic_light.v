module traffic_light(clk_50M,rst_n,seg7_road1_ch,seg7_road1_dv,seg7_road2_ch,seg7_road2_dv,LEDS);

input clk_50M;
input rst_n;
output [6:0] seg7_road1_ch,seg7_road1_dv,seg7_road2_ch,seg7_road2_dv;

output [5:0] LEDS;
wire clk, rst_n;
wire clk_50M;
wire [5:0] s_r1, s_r2;
wire [5:0] s_sub1, s_sub2;
wire [4:0] r1_ch,r1_dv, r2_ch, r2_dv;


div_clk div_clk(
.clk_50M(clk_50M),
.clk(clk)
);

//fsm fsm(
//.clk(clk),
//.rst_n(rst_n),
//.LEDS(LEDS)
//);


FSM_x FSM(
	.clk_50(clk_50M),
	.clk_1s(clk),
	.reset(rst_n),
	.LEDS(LEDS)
);


count_sub cnt_sub(

.clk(clk),
.rst_n(rst_n),
.s_r1(s_r1),
.s_r2(s_r2),

.s_sub_r1(s_sub1),
.s_sub_r2(s_sub2)

);

sep2 sep2_road1(
.in(s_sub1),
.ch(r1_ch),
.dv(r1_dv)
);

sep2 sep2_road2(
.in(s_sub2),
.ch(r2_ch),
.dv(r2_dv)
);

display dis(
.clk(clk),
.s_ch1(r1_ch),
.s_dv1(r1_dv),
.s_ch2(r2_ch),
.s_dv2(r2_dv),
.seg7_road1_ch(seg7_road1_ch),
.seg7_road1_dv(seg7_road1_dv),
.seg7_road2_ch(seg7_road2_ch),
.seg7_road2_dv(seg7_road2_dv)
);

endmodule

