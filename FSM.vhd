library ieee;
use ieee.std_logic_1164.all;

entity FSM_x is
port(
	clk_50: in std_logic;
	clk_1s: in std_logic;
	reset: in std_logic;
	LEDR1: out std_logic;
	LEDR2: out std_logic;
	LEDG1: out std_logic;
	LEDG2: out std_logic;
	LEDY1: out std_logic;
	LEDY2: out std_logic
);
end FSM_x;

architecture behavior of FSM_x is

Type state_type is (S0,S1,S2,S3,S4,S5);
signal Current_state, Next_state: state_type;
signal cnt: integer;

begin
	process(clk_50, reset)
	begin
		if(reset = '0') then
			Current_state <= S0;
			Next_state <= S0;
			cnt <= 0;
		else
			if(clk'event and clk = '1') then
				Current_state <= Next_state;
			end if;
		end if;
	end process;
	
	----------------------
	process(clk_1s)
		begin
			case Current_state is
				when S0 =>
					LEDG1 <= '1';
					LEDR1 <= '1';
					LEDG2 <= '0';
					LEDR2 <= '0';
					LEDY1 <= '0';
					LEDY2 <= '0';
					if(clk_1s'event and clk_1s ='1') then
						cnt <= cnt +1;
						if(cnt >= 5) then Next_state <= S1; cnt <= 0;
						end if;
					end if;
				when S1 =>
					LEDG1 <= '0';
					LEDR1 <= '1';
					LEDG2 <= '0';
					LEDR2 <= '0';
					LEDY1 <= '1';
					LEDY2 <= '0';
					if(clk_1s'event and clk_1s ='1') then
						cnt <= cnt +1;
						if(cnt >= 3) then Next_state <= S2; cnt <= 0;
						end if;
					end if;
				when S2 =>
					LEDG1 <= '0';
					LEDR1 <= '1';
					LEDG2 <= '0';
					LEDR2 <= '1';
					LEDY1 <= '0';
					LEDY2 <= '0';
					if(clk_1s'event and clk_1s ='1') then
						cnt <= cnt +1;
						if(cnt >= 3) then Next_state <= S3; cnt <= 0;
						end if;
					end if;
				when S3 =>
					LEDG1 <= '0';
					LEDR1 <= '1';
					LEDG2 <= '1';
					LEDR2 <= '0';
					LEDY1 <= '0';
					LEDY2 <= '0';
					if(clk_1s'event and clk_1s ='1') then
						cnt <= cnt +1;
						if(cnt >= 10) then Next_state <= S4; cnt <= 0;
						end if;
					end if;
				when S4 =>
					LEDG1 <= '0';
					LEDR1 <= '1';
					LEDG2 <= '0';
					LEDR2 <= '0';
					LEDY1 <= '0';
					LEDY2 <= '1';
					if(clk_1s'event and clk_1s ='1') then
						cnt <= cnt +1;
						if(cnt >= 3) then Next_state <= S5; cnt <= 0;
						end if;
					end if;
				when S5 =>
					LEDG1 <= '0';
					LEDR1 <= '1';
					LEDG2 <= '0';
					LEDR2 <= '1';
					LEDY1 <= '0';
					LEDY2 <= '0';
					if(clk_1s'event and clk_1s ='1') then
						cnt <= cnt +1;
						if(cnt >= 3) then Next_state <= S0; cnt <= 0;
						end if;
					end if;
				end case;
			end process;

end behavior;