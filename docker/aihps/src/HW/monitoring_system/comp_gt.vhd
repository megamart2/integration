
----------------------------------------------------------------------------------
-- Company: University of l'Aquila
-- File :comp_gt.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : comparator gt, used to individuate right address position
-- Date, Author, Revision id, Comments
-- 25/3/15 Giacomo Valente / 0.0 Creation 									
									-- TO DO: add comments after each instantiation, each signal and each process
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_gt is
generic (dim_bus_gt_g:positive:=32); --dimension of the gt comparator

port(BUS_in:in std_logic_vector(dim_bus_gt_g-1 downto 0); -- first input, if this input is greater than  another, output is high
	  F_MIN_in:in std_logic_vector(dim_bus_gt_g-1 downto 0); -- second input
       MAG_out:out std_logic); --output

end comp_gt;



architecture arc_comp_gt of comp_gt is
signal sig_app: std_logic:='0';

begin
comb:process (BUS_in, F_MIN_in)
	begin
		if (BUS_in<F_MIN_in or BUS_in=F_MIN_in) then
			sig_app<='0';
		elsif (BUS_in>F_MIN_in) then
			sig_app<='1';
		else
			sig_app<='0';
		end if;
	end process;
	
mag_out<= sig_app;

end arc_comp_gt;
