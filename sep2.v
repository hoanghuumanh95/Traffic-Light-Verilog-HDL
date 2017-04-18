module sep2 (in, ch,dv);

input [5:0] in;
output reg [4:0] ch, dv;

always @(in)
begin
	if(in<10)
		begin
			ch <= 0;
			dv <= in;
		end
	else if(in<20)
				begin
					ch <= 1;
					dv <= in - 10;
				end
			else if(in <30)
						begin
							ch <= 2;
							dv <= dv -20;
						end
					else if(in<40)
								begin
									ch <= 3;
									dv <= dv - 30;
								end
							else if(in<50)
										begin
											ch <= 4;
											dv <= in - 40;
										end
									else if(dv<60)
												begin
													ch <= 5;
													dv <= in - 50;
												end
											else
												begin
													ch <= 0;
													dv <= 0;
												end
end
endmodule												
						
									
					
			