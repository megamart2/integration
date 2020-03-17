----------------------------------------------------------------------------------
-- Company: University of l'Aquila
-- File : adapter_ahb.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : adapter module of profiler ahb
-- Date, Author, Revision id, Comments
-- 20/3/15 giacomo / 0.0 Creation 
-- 02/04/15 andrea / 0.1 change during_Read_out with during_read_out
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;

library gaisler;
use gaisler.misc.all;
use gaisler.uart.all;
use gaisler.libdcom.all;

entity adapter_ahb is
  port (clkm : in  std_logic;
        ahbo_sniff_in: in ahb_slv_in_type;
        event_ok_out : out std_logic;
        BUS_IN_out : out std_logic_vector (31 downto 0);
        ld_stable_out : out std_logic;
        during_write_out : out std_logic;
        during_read_out : out std_logic
   );
end;

architecture adapter_ahb_arch of adapter_ahb is
begin
  BUS_IN_out <= ahbo_sniff_in.haddr;
  ld_stable_out <= not clkm;
  during_read_out<= not ahbo_sniff_in.hwrite;
  during_write_out<= ahbo_sniff_in.hwrite;
  --if no idle transfer (htrans /= 00) and the transfer has completed successfully (hready =1) => event_ok = 1
   event_ok_out<=((not ahbo_sniff_in.htrans(0) and ahbo_sniff_in.htrans(1)) or (ahbo_sniff_in.htrans(0) and ahbo_sniff_in.htrans(1))) and ahbo_sniff_in.hready;
end;
