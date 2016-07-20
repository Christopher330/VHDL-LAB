--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:39:46 07/18/2015
-- Design Name:   
-- Module Name:   E:/Lab3/test_serial.vhd
-- Project Name:  Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: serial
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_serial IS
END test_serial;
 
ARCHITECTURE behavior OF test_serial IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT serial
    PORT(
         serialdata : IN  std_logic;
         clk : IN  std_logic;
         csn : IN  std_logic;
         wrn : IN  std_logic;
         rdn : IN  std_logic;
         addr : IN  std_logic_vector(1 downto 0);
         data : INOUT  std_logic_vector(7 downto 0);
         intn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal serialdata : std_logic := '0';
   signal clk : std_logic := '0';
   signal csn : std_logic := '0';
   signal wrn : std_logic := '0';
   signal rdn : std_logic := '0';
   signal addr : std_logic_vector(1 downto 0) := (others => '0');

	--BiDirs
   signal data : std_logic_vector(7 downto 0);

 	--Outputs
   signal intn : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: serial PORT MAP (
          serialdata => serialdata,
          clk => clk,
          csn => csn,
          wrn => wrn,
          rdn => rdn,
          addr => addr,
          data => data,
          intn => intn
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		rdn<='1';
		csn<='0';
		wrn<='1';
		addr<="00";
		serialdata<='1';
		wait for 20 ns;
		csn<='0';
		wrn<='1';
		rdn<='1';
      wait for 20 ns;
		wrn<='0';
		addr<="00";
		wait for 20 ns;
		wrn<='1';
		wait for 20 ns;
		wrn<='0';
		addr<="01";
		wait for 20 ns;
		wrn<='1';
		wait for 20 ns;
		wrn<='0';
		addr<="10";
		wait for 20 ns;
		wrn<='1';
		wait for 20 ns;
		wrn<='0';
		addr<="11";     --清中断
		wait for 20 ns;
		csn<='1';
		wrn<='1';
		rdn<='1';
		serialdata<='1';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;    --数据输入
		serialdata<='0';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;
		serialdata<='1';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;
		serialdata<='1';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;
		serialdata<='1';   --数据输入结束 00101001
      wait for 10 ns;
		serialdata<='1'; --9
      wait for 10 ns;
		serialdata<='1'; --10
      wait for 10 ns;
		serialdata<='1'; --11
      wait for 10 ns;
		csn<='0';
		wrn<='1';
		rdn<='0';
		addr<="01";      --读中断  001
		wait for 10 ns;
		rdn<='1';
		wait for 10 ns;
		wrn<='1';
		rdn<='0';
		addr<="00";       --读数据
		wait for 10 ns;
		wrn<='0';
		rdn<='1';
		addr<="01";     --清除结束中断
		wait for 10 ns;
		wrn<='1';
		wait for 10 ns;
		wrn<='1';
		rdn<='0';
		addr<="01";     --读清除结束中断后的中断
		
		
		wait for 10 ns;
		rdn<='1';
		csn<='0';
		wrn<='1';
		addr<="00";
		serialdata<='1';
		wait for 20 ns;
		csn<='0';
		wrn<='1';
		rdn<='1';
      wait for 20 ns;
		wrn<='0';
		addr<="00";
		wait for 20 ns;
		wrn<='1';
		wait for 20 ns;
		wrn<='0';
		addr<="01";
		wait for 20 ns;
		wrn<='1';
		wait for 20 ns;
		wrn<='0';
		addr<="10";
		wait for 20 ns;
		wrn<='1';
		wait for 20 ns;
		wrn<='0';
		addr<="11";
		wait for 20 ns;
		wrn<='1';
		rdn<='1';
		serialdata<='1';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;
		serialdata<='1';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;
		serialdata<='1';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;
		serialdata<='0';
      wait for 10 ns;
		serialdata<='1'; --00101001
      wait for 10 ns;
		serialdata<='0'; --9
      wait for 10 ns;
		serialdata<='1'; --10
      wait for 10 ns;
		serialdata<='1'; --11
      wait for 10 ns;
		csn<='0';
		wrn<='1';
		rdn<='0';
		addr<="01";  --读中断    011
		
		wait for 10 ns;
		rdn<='1';
		wait for 10 ns;
		wrn<='1';
		rdn<='0';
		addr<="00";       --读数据
		
		wait for 10 ns;
		rdn<='1';
		wait for 10 ns;
		wrn<='0';
		rdn<='1';
		addr<="10";  --清除校验中断  001
		wait for 10 ns;
		rdn<='1';
		wait for 10 ns;
		wrn<='1';
		rdn<='0';
		addr<="01";       --读中断
		wait for 10 ns;
		wrn<='1';
		serialdata<='0';
		wait for 10 ns;
		wrn<='1';
		rdn<='0';
		addr<="01";    --读清除校验中断后的中断，应该为101
		wait for 10 ns;
		wrn<='0';
		rdn<='1';
		addr<="11";    --清除溢出中断
		wait for 10 ns;
		wrn<='1';
		rdn<='0';
		addr<="01";    
		wait for 10 ns;
		wrn<='0';
		rdn<='1';
		addr<="01";    --清除结束中断
		wait for 10 ns;
		wrn<='1';
		rdn<='0';
		addr<="01";   

      wait;
   end process;

END;
