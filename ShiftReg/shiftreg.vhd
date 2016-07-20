----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:04:02 07/09/2015 
-- Design Name: 
-- Module Name:    shiftreg - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shiftreg is
    Port ( A : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           B : out  STD_LOGIC);
end shiftreg;

architecture Behavioral of shiftreg is

component dff
    Port (d, clk : in std_logic;                
	       q : out std_logic);  
end component;
signal temp : std_logic_vector(0 to 4);
begin
    temp(0) <= A;
	 G1 : for i in 0 to 3 generate
	 dff1 : dff port map(d => temp(i),
								clk =>clk,
								q => temp(i+1));
	end generate;
	B <= temp(4);
end Behavioral;

