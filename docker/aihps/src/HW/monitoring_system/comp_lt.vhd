

----------------------------------------------------------------------------------
-- Company: University of l'Aquila
-- File :comp_lt.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : comparator lt, used to individuate right address position
-- Date, Author, Revision id, Comments
-- 26/3/15 Giacomo Valente / 0.0 Creation 									
									-- TO DO: add comments after each instantiation, each signal and each process
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_lt is
generic (dim_bus_lt_g:positive:=32); --dimension of the lt comparator

port(BUS_in:in std_logic_vector(dim_bus_lt_g-1 downto 0); -- first input, if this input is lower than  another, output is high
	  F_SUP_in:in std_logic_vector(dim_bus_lt_g-1 downto 0); -- second input
       MIN_out:out std_logic); --output

end comp_lt;



architecture arc_comp_lt of comp_lt is

signal sig_app: std_logic:='0';

begin
comb:process (BUS_IN, F_SUP_in)
	begin
		if (BUS_IN<F_SUP_in) then
			sig_app<='1';
		elsif (BUS_IN>F_SUP_in or BUS_IN=F_SUP_in) then
			sig_app<='0';
		else
			sig_app<='0';
		end if;
	end process;
	
min_out<= sig_app;

end arc_comp_lt;
