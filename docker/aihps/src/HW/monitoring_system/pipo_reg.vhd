

-- Company: University of l'Aquila
-- File : pipo_reg.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : smart pipo register
-- Date, Author, Revision id, Comments
-- 20/3/15 Giacomo Valente / 0.0 Creation 
								-- TO DO add comments after each instantiation, each signal and each process

-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipo_reg is
	generic (dim_in_g:positive:=32; --set the register dimension
				dim_out_g:positive:=32 --set the output dimension
				);
	port(clk_reg_in:in std_logic;
			rst_reg_in: in std_logic;
		 	I_in:in std_logic_vector( dim_in_g-1 downto 0);
			O_out:out std_logic_vector ( dim_out_g-1 downto 0)
			);
end pipo_reg;


architecture arc_pipo_reg of pipo_reg is

begin

		
	pipo:process(clk_reg_in,rst_reg_in)
	begin
		if (rst_reg_in='1') then
			O_out<=(others=>'0');
		elsif rising_edge(clk_reg_in) then
			O_out<=I_in( dim_out_g-1 downto 0);
		end if;
		
	end process;

end arc_pipo_reg;
