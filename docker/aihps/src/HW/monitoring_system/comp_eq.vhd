
-- Company: University of l'Aquila
-- File : comp_eq.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : comparator eq, used to individuate right address position
-- Date, Author, Revision id, Comments
-- 15/3/15 Giacomo Valente / 0.0 Creation 
								--TO DO: adds comments after each instantiation

-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity comp_eq is
generic (dim_bus_eq_g:positive:=32);
port(comp1_in:in std_logic_vector(dim_bus_eq_g-1 downto 0);
		comp2_in:in std_logic_vector(dim_bus_eq_g-1 downto 0);
       comp_out:out std_logic);

end comp_eq;


architecture arc_comp_eq of comp_eq is
signal sig_app: std_logic:='0';

begin
comb:process (comp1_in, comp2_in)
	begin
		if (comp1_in=comp2_in) then
			sig_app<='1';
		else
			sig_app<='0';
		end if;
	end process;
	
comp_out<= sig_app;

end arc_comp_eq;

