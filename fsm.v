module fsm(clk, rst_n, LEDS);

parameter SEC0 = 5;
parameter SEC1 = 3;
parameter SEC2 = 3;
parameter SEC3 = 10;
parameter SEC4 = 3;
parameter SEC5 = 3;


input clk, rst_n;

output reg [5:0] LEDS;
reg[2:0] state, next_state;
reg [5:0] cnt;

localparam 	S0 = 000,
				S1 = 001,
				S2 = 010,
				S3 = 011,
				S4 = 100,
				S5 = 101;
always@(posedge clk or negedge rst_n)
			begin
				if(!rst_n)
					begin
						cnt <= 0;
						state <= S0;
					end
				else
					case(state)
						S0: if(cnt < SEC0)
								begin
									state <= S0;
									cnt <= cnt + 1;
								end
							else
								begin
									state <= S1;
									cnt <= 0 ;
								end
						S1: if(cnt < SEC1)
								begin
									state <= S1;
									cnt <= cnt + 1;
								end
							else
								begin
									state <= S2;
									cnt <= 0 ;
								end
						
						S2: if(cnt < SEC2)
								begin
									state <= S2;
									cnt <= cnt + 1;
								end
							else
								begin
									state <= S3;
									cnt <= 0 ;
								end
								
						S3: if(cnt < SEC3)
								begin
									state <= S3;
									cnt <= cnt + 1;
								end
							else
								begin
									state <= S4;
									cnt <= 0 ;
								end
						
					S4: if(cnt < SEC4)
								begin
									state <= S4;
									cnt <= cnt + 1;
								end
							else
								begin
									state <= S5;
									cnt <= 0 ;
								end
							
						S5: if(cnt < SEC0)
								begin
									state <= S5;
									cnt <= cnt + 1;
								end
							else
								begin
									state <= S0;
									cnt <= 0 ;
								end	
						default state <= S0;
				endcase
		end
always@*
			begin
				case(state)
					S0 : LEDS = 6'b100001;
							
					S1 : LEDS = 6'b010001;
							
					S2 :  LEDS = 6'b001001;
							
					S3 : LEDS = 6'b001100;
							
					S4 :  LEDS = 6'b001010;
							
					S5 :  LEDS = 6'b001001;
							
				default  LEDS = 6'b100001;
				
				endcase
			end
endmodule
								
