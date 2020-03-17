----------------------------------------------------------------------------------
-- Company: University of l'Aquila
-- File : top_profiler_ahb.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : top level profiler with adapters for AMBA AHB bus and AMBA APB bus
-- Date, Author, Revision id, Comments
-- 02/04/15 Andrea Moro / 0.0 Creation 
-- 30/04/15 Giacomo Valente / 1.0 corrected internal signal names following the rules
									--reviewed signal connection fixing some errors
									--section that enables the decoding under review: 
--									  with assumption that leon3 wait the decoding time of theprofiler, it is well designed. 
--                           Therefore, ready signal will be used to build a smart system,
									-- TO DO: should be used modular block pipo_reg to instantiate registers
									-- TO DO: add comments after each instantiation, each signal and each process
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mux_package.all; --added to consider the mux_package
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library gaisler;
use gaisler.misc.all;
use gaisler.uart.all;
use gaisler.libdcom.all;

entity top_profiler_ahb is
  generic (pindex : integer := 0;
           paddr : integer := 0;
           pmask : integer := 16#fff#
    );
  port(clkm : in  std_logic; --system clock
       rst_a : in std_logic;
       apbi_in : in apb_slv_in_type; -- slave input ( from leon apb controller)
       ahbo_sniff_in: in ahb_slv_in_type; --connection to ahb (to monitor)
       apbo_out : out apb_slv_out_type --slave output (to leon apb controller)
    );

end top_profiler_ahb;

architecture behavioural of top_profiler_ahb is

	-------------------------pipo_reg declaration---------------------
		COMPONENT pipo_reg
		generic (dim_in_g:positive:=32; 
				dim_out_g:positive:=32 
				);
		PORT(
			clk_reg_in : IN std_logic;
			rst_reg_in : IN std_logic;
			I_in : IN std_logic_vector(dim_in_g-1 downto 0);          
			O_out : OUT std_logic_vector(dim_out_g-1 downto 0)
			);
		END COMPONENT;
		
		
---------------------------core_profiler---------------------------
component core_profiler
  port(clkm : in std_logic; --system clock
       rst_a : in std_logic; --ASYNC RESET
       during_read : in std_logic; --event occurred (for time monitor)
       during_write : in std_logic; --event occurred (for time monitor)
       ld_stable : in std_logic; --sampling event
       data_bus_in : in std_logic_vector(31 downto 0); --input to be monitored
       event_ok : in std_logic;--event occurred (for event monitor)
       control_bus_in : in std_logic_vector(31 downto 0); -- frame received for sniffer control
       en_decode : in std_logic; --enables decode of received frame
       go_idle : out std_logic; --sends to idle all the fsm
       ready : out std_logic; -- indicates that decode section is ready to decode a control frame
       profiler_result : out std_logic_vector(31 downto 0) --result output from register
    );
  end component;
---------------------------adapter_ahb declaration---------------------------
  component adapter_ahb
  port (clkm : in std_logic;
        ahbo_sniff_in : in ahb_slv_in_type;
        event_ok_out : out std_logic;
        BUS_IN_out : out std_logic_vector (31 downto 0);
        ld_stable_out : out std_logic;
        during_write_out : out std_logic;
        during_read_out : out std_logic
    );
end component;
---------------------------APB interface constants---------------------------
constant REVISION : integer := 0;
constant PCONFIG : apb_config_type := (0 => ahb_device_reg (VendOR_CONTRIB,GAISLER_ATAPBSLV,0,REVISION,0),  --(0x09 a 16bit(generic vendor),device_id, 0, REVISION, 0) look and or modify devices.vhd
                                       1 => apb_iobar(paddr,pmask));
---------------------------internal signals declaration---------------------------
--core profiler
signal sig_during_read : std_logic;
signal sig_during_write : std_logic;
signal sig_ld_stable : std_logic;
signal sig_bus_input : std_logic_vector(31 downto 0);
signal sig_event_ok : std_logic;
signal sig_apbi_data_in : std_logic_vector(31 downto 0); --contains the received data from the apb, must be keeped stable until the decode section is ready
signal sig_en_decode : std_logic; --informs the decode section that a new data is ready to be decoded
--signal go_idle : std_logic;
--signal ready : std_logic;
signal sig_profiler_result : std_logic_vector(31 downto 0); --contains the result from the sniffer, ready to be sent
--positive edge trigger
signal sig_edge_trigger_in : std_logic;
signal sig_edge_trigger_out : std_logic;
signal sig_rst_p: std_logic; --positive reset

begin

sig_rst_p<= not rst_a;
  
---------------------------inst_core_profiler_1---------------------------
-- represents the nucleus of the sniffer
  inst_core_profiler_1 : core_profiler
  port map(clkm => clkm,
           rst_a => sig_rst_p,
           during_read => sig_during_read,
           during_write => sig_during_write,
           ld_stable => sig_ld_stable,
           data_bus_in => sig_bus_input,
           event_ok => sig_event_ok,
           control_bus_in => sig_apbi_data_in,
           en_decode => sig_en_decode,
           go_idle => open,--go_idle uncomment if used 
           ready => open,--ready uncomment if used 
           profiler_result => sig_profiler_result
    );
---------------------------inst_adapter_ahb_1 instantiation ---------------------------
-- adapter section to monitor the AHB bus
  inst_adapter_ahb_1: adapter_ahb
  port map(clkm => clkm,
           ahbo_sniff_in => ahbo_sniff_in,
           event_ok_out => sig_event_ok,
           BUS_IN_out => sig_bus_input,
           ld_stable_out => sig_ld_stable,
           during_write_out => sig_during_write,
           during_read_out => sig_during_read
    );
---------------------------inst_apb_input_register instantiation--------------------------- 
  --stores the value coming from apb bus in a register. the storage should be done until the ready signal is received from decode section.
  --input
  inst_apb_input_register : process(clkm, sig_rst_p)
  begin
    if sig_rst_p = '1' then--modify reset active low or high
      sig_apbi_data_in <= (others => '0');
    elsif rising_edge(clkm) then
      if (apbi_in.psel(pindex) and apbi_in.penable and apbi_in.pwrite) = '1' then
        sig_apbi_data_in <= apbi_in.pwdata;
      end if;
    end if;
  end process;
  --output
  apbo_out.prdata <= sig_profiler_result; -- drive apb read bus with output of i_pipo_reg_out_1 register
  apbo_out.pirq <= (others => '0'); -- No IRQ
  apbo_out.pindex <= pindex; -- VHDL generic
  apbo_out.pconfig <= PCONFIG; -- Config constant
  -- boot message
  -- pragma translate_off
  bootmsg : report_version
  generic map ("Profiler" & tost(pindex) &": Core rev " & tost(REVISION));
  -- pragma translate_on
  
  
  
---------------------------positive edge trigger---------------------------
  --used to enable sig_en_decode signal
  positive_edge_trigger_1 : process(clkm, sig_rst_p)
  begin
    if sig_rst_p = '1' then
      sig_edge_trigger_out <= '0';
    elsif rising_edge(clkm) then
      sig_edge_trigger_out <= sig_edge_trigger_in;
    end if;
  end process;
  
  edge_trigger_input_signal : process(apbi_in.psel(pindex), apbi_in.penable, apbi_in.pwrite)
  begin
    if (apbi_in.psel(pindex) and apbi_in.penable and apbi_in.pwrite) = '1' then
      sig_edge_trigger_in <= '1';
    else
      sig_edge_trigger_in <= '0';
    end if;  
  end process;
  
  sig_en_decode <= sig_edge_trigger_out and not sig_edge_trigger_in;

end Behavioural;
