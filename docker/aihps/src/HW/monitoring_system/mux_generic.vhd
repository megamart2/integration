----------------------------------------------------------------------------------
-- Company: University of l'Aquila
-- File : mux_generic.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : generic multiplexer
-- Date, Author, Revision id, Comments
-- 02/04/15 Andrea Moro / 0.0 Creation 
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.mux_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_generic is
  generic(dim_port : positive;
          no_port : positive
    );
  port(Input_ports: IN std_logic_vector((dim_port*no_port)-1 downto 0); 
       Sel_port: IN std_logic_vector(width(no_port)-1 downto 0); 
       Out_port: OUT std_logic_vector(dim_port-1 downto 0)
    );
  subtype sel_val is INTEGER RANGE 0 to no_port-1;
end mux_generic;

architecture Behavioral of mux_generic is
  signal sig_Sel: std_logic_vector(dim_port-1 downto 0);
  begin
    process(Sel_port, Input_ports)
      variable sel1: sel_val;
    begin
      sel1 := sel_val(bin_to_int(Sel_port));
      sig_Sel <= Input_ports(((sel1+1)*dim_port)-1 downto sel1*dim_port);
    end process;
      Out_port <= sig_Sel;
end Behavioral;

