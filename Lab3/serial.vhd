----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:38:57 07/18/2015 
-- Design Name: 
-- Module Name:    serial - Behavioral 
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

entity serial is
 Port ( serialdata : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           csn : in  STD_LOGIC;
           wrn : in  STD_LOGIC;
           rdn : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (1 downto 0);
           data : inout  STD_LOGIC_VECTOR (7 downto 0);
           intn : out  STD_LOGIC);
end serial;

architecture Behavioral of serial is
component ctrl is
	Port ( d9 : in  STD_LOGIC;
           d11 : in  STD_LOGIC;
           sq7 : in  STD_LOGIC;
           sq6 : in  STD_LOGIC;
           rq : in  STD_LOGIC_VECTOR (7 downto 0);
           clrn : inout  STD_LOGIC;
           start : out  STD_LOGIC;
           serial : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           csn : in  STD_LOGIC;
           wrn : in  STD_LOGIC; 
           rdn : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (1 downto 0);
           data : inout  STD_LOGIC_VECTOR (7 downto 0);
           intn : out  STD_LOGIC);
	end component;
	
	component decode4 is
	Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           enable : in  STD_LOGIC;
           q8 : out  STD_LOGIC;
           q9 : out  STD_LOGIC;
           q11 : out  STD_LOGIC);
	end component;
	
	component reg8 is
	Port ( clrn : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
	end component; 
	
	component sreg is
	Port ( clk : in  STD_LOGIC;
           clrn : in  STD_LOGIC;
           serial : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component count4 is
	Port ( clk : in  STD_LOGIC;
           clrn : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	signal c : std_logic_vector(3 downto 0);
	signal start, t8, t9, t11, clrn : std_logic;
	signal tdata, treg : std_logic_vector(7 downto 0);
begin
	my_count4 : count4 port map(clk, start, c);
   my_decode4 : decode4 port map(c, start, t8, t9, t11);
	my_sreg : sreg port map(clk, start, serialdata, tdata);
	my_reg8 : reg8 port map(clrn,t8,tdata, treg);
	my_ctrl : ctrl port map(t9, t11, tdata(7), tdata(6), treg, clrn, start, serialdata, clk, csn, wrn, rdn, addr, data, intn);
end Behavioral;


