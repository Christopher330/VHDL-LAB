----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:15 07/02/2016 
-- Design Name: 
-- Module Name:    lab2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab2 is
    Port ( reset : in  STD_LOGIC;
           read_ins : in  STD_LOGIC;
           read_data : in  STD_LOGIC;
           write_data : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           oe : out  STD_LOGIC;
           we : out  STD_LOGIC);
end lab2;

architecture Behavioral of lab2 is
type state is(state0,state1,state2);
signal pr_state,nx_state : state;
signal tempwe,tempoe:std_logic;
begin

process(reset,clk)
begin
	if (reset='1')then
		pr_state <=state0;
		oe<='0';
		we<='0';
	elsif (clk'event and clk='1') then
		oe<=tempoe;
		we<=tempwe;
		pr_state<=nx_state;
	end if;
end process;

process(read_ins,read_data,write_data,reset,pr_state)
begin
	case pr_state is
		when state0=>tempwe<='0';
						tempoe<='0';
						if(read_ins='1' and reset='0') then nx_state<=state1;
						elsif(read_data='1' and reset='0') then nx_state<=state1;
						elsif(write_data='1' and reset='0') then nx_state<=state2;
						end if ;
		when state1=>tempwe<='0';
						tempoe<='1';
						if(read_ins='1' and reset='0') then nx_state<=state1;
						elsif(read_data='1' and reset='0') then nx_state<=state1;
						elsif(write_data='1' and reset='0') then nx_state<=state2;
						end if ;
		when state2=>tempwe<='1';
						tempoe<='0';
						if(read_ins='1' and reset='0') then nx_state<=state1;
						elsif(read_data='1' and reset='0') then nx_state<=state1;
						elsif(write_data='1' and reset='0') then nx_state<=state2;
						end if ;
	end case;
end process;
end Behavioral;

