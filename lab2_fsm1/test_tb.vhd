--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:02:50 07/02/2016
-- Design Name:   
-- Module Name:   C:/JSJSJYSJ/lab2_fsm1/test_tb.vhd
-- Project Name:  lab2_fsm1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lab2_fsm1
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
 
ENTITY test_tb IS
END test_tb;
 
ARCHITECTURE behavior OF test_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lab2_fsm1
    PORT(
         read_ins : IN  std_logic;
         read_data : IN  std_logic;
         write_data : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         oe : OUT  std_logic;
         we : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal read_ins : std_logic := '0';
   signal read_data : std_logic := '0';
   signal write_data : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal oe : std_logic;
   signal we : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab2_fsm1 PORT MAP (
          read_ins => read_ins,
          read_data => read_data,
          write_data => write_data,
          reset => reset,
          clk => clk,
          oe => oe,
          we => we
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
      -- hold reset state for 100 ns.	
		reset <='1';
      read_ins <='0';
      read_data <='1';
      write_data <='0';
		wait for 16 ns;	
		reset <='0';
      read_ins <='0';
      read_data <='1';
      write_data <='0';
		wait for 20 ns;	
		reset <='0';
      read_ins <='0';
      read_data <='0';
      write_data <='1';
		wait for 20 ns;	
		reset <='0';
      read_ins <='1';
      read_data <='0';
      write_data <='0';
      -- insert stimulus here 

      wait;
   end process;

END;
