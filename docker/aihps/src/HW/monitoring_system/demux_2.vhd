
----------------------------------------------------------------------------------
-- Company: University of l'Aquila
-- File :demux_2.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : demux
-- Date, Author, Revision id, Comments
-- 26/3/15 Giacomo Valente / 0.0 Creation 									
									-- TO DO: add comments after each instantiation, each signal and each process
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity demux_2 is
	port (bus_total_in:in std_logic_vector (31 downto 0);
			sel2_in: in std_logic_vector (1 downto 0);
			sup_out:out std_logic_vector(31 downto 0);
			inf_out:out std_logic_vector(31 downto 0);
			addr_s_out:out std_logic_vector (31 downto 0);
			other_out: out std_logic_vector (31 downto 0)
			);
end demux_2;



architecture arc_demux_2 of demux_2 is

begin
	sup_out<=bus_total_in when sel2_in="11" else 
	"00000000000000000000000000000000";
	
   inf_out<=bus_total_in when sel2_in="10" else 
	"00000000000000000000000000000000";
	
	addr_s_out<=bus_total_in when sel2_in="01" else
	"00000000000000000000000000000000";
	
	other_out<=bus_total_in when sel2_in="00" else
	"00000000000000000000000000000000";

	
	
end arc_demux_2;

