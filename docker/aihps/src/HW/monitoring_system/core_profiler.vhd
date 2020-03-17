-- Company: University of l'Aquila
-- File : core_profiler.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : top level nucleus profiler
-- Date, Author, Revision id, Comments
-- 02/04/15 Andrea Moro / 0.0 Creation 
-- 30/04/15 Giacomo Valente / 1.0 deleted unnecessary declarations
									--TO DO: add comments after each instantiation, each signal and each process
									-- TO DO: change pipo inst_pp_enable using pipo_reg, for modularity. This for all registers.
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mux_package.all; --added to consider the mux_package

entity core_profiler is
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
end core_profiler;

architecture rtl of core_profiler is

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
---------------------------mux_generic declaration---------------------------
  component mux_generic
  generic(dim_port : positive;
          no_port : positive
    );
  port(input_ports : in std_logic_vector((dim_port*no_port)-1 downto 0);
       Sel_port : in std_logic_vector(width(no_port)-1 downto 0); 
       Out_port : out std_logic_vector(dim_port-1 downto 0)
    );
  end component;
---------------------------time_monitor declaration---------------------------
  component time_monitor
  port(run_profiler_in : in std_logic;
       during_read_in : in std_logic;
       during_write_in : in std_logic;
       rst_t1_in : in std_logic;
       SEL3_in : in std_logic_vector (1 downto 0);
       ld_Stable_in : in std_logic;
       BUS_in : in std_logic_vector (31 downto 0);
       rst_reg_in : in std_logic;
       ld_single_in : in std_logic;
       BUS_SinGLE_in : in std_logic_vector (31 downto 0);
	   
	event_ok: in std_logic;
       ld_ac_tm_out : out std_logic;
       en_count_out: out std_logic
	   
    );
  end component;
---------------------------event_monitor declaration ---------------------------
  component event_monitor
  port(ld_inf_in : in std_logic;
       ld_sup_in : in std_logic;
       bus_sup_in : in std_logic_vector(31 downto 0);
       bus_inf_in : in std_logic_vector(31 downto 0);
       rst_reg_in : in std_logic;
       bus_in : in std_logic_vector(31 downto 0);
       run_profiler_in : in std_logic;
       event_ok_in : in std_logic;
       bus_single_in : in std_logic_vector(31 downto 0);
       ld_single_in : in std_logic;
       ld_stable_in : in std_logic;
       en_addr_m_in : in std_logic;
       en_addr_s_in : in std_logic;
       ld_ac_event_out : out std_logic
    );
  end component;
---------------------------counter_declaration ---------------------------
  component counter
  generic (dim_bit_g : positive := 16); --set the dimension of the counter
  port(reset_a : in std_logic; --resets counter
       clk : in std_logic;
       error_out : out std_logic; --signals overflow
       counter_out : out std_logic_vector(dim_bit_g-1 downto 0) --output
    ); 
  end component;

---------------------------demux_2 declaration---------------------------
  component demux_2
  port(bus_total_in : in std_logic_vector(31 downto 0);
       sel2_in : in std_logic_vector(1 downto 0);
       sup_out : out std_logic_vector(31 downto 0);
       inf_out : out std_logic_vector(31 downto 0);
       addr_s_out : out std_logic_vector(31 downto 0);
       other_out : out std_logic_vector(31 downto 0)
    );
  end component;
---------------------------msf_decode declaration ---------------------------
  component msf_decode
  port(cntrl_st : in std_logic;
       cntrl_mode_1 : in std_logic;
       cntrl_mode_2 : in std_logic;
       cntrl_mode_3 : in std_logic;
       cntrl_mode_4 : in std_logic;
       cntrl_mode_5 : in std_logic;
       cntrl_mode_6 : in std_logic;
       cntrl_run : in std_logic;
       cntrl_rst : in std_logic;
       cntrl_idle : in std_logic;
       error : in std_logic;
       clk_m : in std_logic;
       en_count : in std_logic;
       mod_range: in std_logic;
       en_decode: in std_logic;
       sel2 : out std_logic_vector(1 downto 0);
       ready : out std_logic;
       ld_inf : out std_logic;
       rst_ac : out std_logic;
       ld_sup : out std_logic;
       ld_single : out std_logic;
       run_profiler : out std_logic;
       finish : out std_logic;
       go_idle : out std_logic;
       rst_t1 : out std_logic;
       sel3 : out std_logic_vector(1 downto 0);
       addr_mx : out std_logic;
       addr_sx : out std_logic;
       ld_en : out std_logic;
       sel4 : out std_logic
    );
  end component;
---------------------------internal signals declaration---------------------------
  --mux_gen
  signal sig_mux_generic_1_out : std_logic := '0'; --output of mux for counter
  --fsm decode
  signal sig_sel4 : std_logic :='0'; -- selects the mux before the counter
  signal sig_run_profiler : std_logic :='0'; --enables profiling actions
  signal sig_rst_t1 : std_logic :='0'; --t ff reset of time monitor
  signal sig_sel3 : std_logic_vector (1 downto 0):=(others => '0'); --controls of mux3 in time monitor for propagation between during_read and during_write
  signal sig_ld_single : std_logic :='0';--samples single address
  signal sig_ld_inf : std_logic :='0'; --samples inf address
  signal sig_ld_sup : std_logic :='0';--samples sup address
  signal sig_rst_ac : std_logic :='0'; --resets the counter
  signal sig_ld_en : std_logic :='0'; --samples the mode of operation
  signal sig_addr_mx : std_logic :='0'; --indicates range address mode from user
  signal sig_addr_sx : std_logic :='0';--indicates single address mode from user
  signal sig_finish : std_logic :='0'; --indicates that profilerhas finished its action
  signal sig_sel2 : std_logic_vector(1 downto 0) :=(others=>'0'); --controls the demux for user code
  signal sig_mod_range : std_logic :='0'; --defines range mode operation
  --demux_2_1
  signal sig_demux_2_1_bus_single_out : std_logic_vector(31 downto 0) :=(others=>'0'); --single address initialization
  signal sig_sup_out : std_logic_vector(31 downto 0) :=(others=>'0'); --sup address initialization
  signal sig_inf_out : std_logic_vector(31 downto 0) :=(others=>'0'); --inf address initialization
  signal sig_other : std_logic_vector(31 downto 0) :=(others=>'0'); -- contains user control code
  --event monitor
  signal sig_ld_ac_event_out : std_logic :='0'; --enables counter from event monitor
  --time monitor
  signal sig_ld_ac_tm_out : std_logic :='0';--enables counter from time monitor
  signal sig_en_count_out : std_logic :='0'; --enables counting from time monitor
  --pipo
  signal sig_en_addr_m: std_logic :='0';--enables range address mode 
  signal sig_en_addr_s: std_logic :='0';--enables single address mode
  --inst_counter_1
  signal sig_error_out : std_logic :='0'; -- indicates overflow error
  signal sig_counter_out : std_logic_vector(31 downto 0) :=(others=>'0'); --counter output
  


begin
---------------------------inst_mux_generic_1 instantiation ---------------------------
--multiplexer that propagates one between time monitor and event monitor toward the counter

  inst_mux_generic_1 : mux_generic 
  generic map (dim_port => 1,
               no_port => 2
    )
  port map(Input_ports(0) => sig_ld_ac_event_out,
           Input_ports(1) => sig_ld_ac_tm_out,
           Sel_port(0) => sig_sel4,
           Out_port(0) => sig_mux_generic_1_out
    );

---------------------------inst_time_monitor_1 instantiation---------------------------
--performs time monitor functions

  inst_time_monitor_1 : time_monitor 
  port map(run_profiler_in => sig_run_profiler,
           during_read_in => during_read,
           during_write_in => during_write, 
           rst_t1_in => sig_rst_t1,
           sel3_in => sig_sel3,
           ld_stable_in => ld_stable, 
           bus_in => data_bus_in, 
           rst_reg_in => rst_a,
           ld_single_in => sig_ld_single,
           bus_single_in => sig_demux_2_1_bus_single_out,
		   
		   event_ok=>event_ok,

           ld_ac_tm_out => sig_ld_ac_tm_out,
           en_count_out => sig_en_count_out
    );
---------------------------inst_event_monitor_1 instantiation---------------------------
--performs event monitor functions

  inst_event_monitor_1 : event_monitor 
  port map(ld_inf_in => sig_ld_inf,
           ld_sup_in => sig_ld_sup,
           bus_sup_in => sig_sup_out ,
           bus_inf_in => sig_inf_out,
           rst_reg_in => rst_a,
           bus_in => data_bus_in, 
           run_profiler_in => sig_run_profiler ,
           event_ok_in => event_ok, 
           bus_single_in => sig_demux_2_1_bus_single_out,
           ld_single_in => sig_ld_single,
           ld_stable_in => ld_stable, 
           en_addr_m_in => sig_en_addr_m, 
           en_addr_s_in => sig_en_addr_s,
           ld_ac_event_out => sig_ld_ac_event_out 
    );
---------------------------inst_counter_1 instantiation---------------------------
---counter module, used to perform time measure or event count
  inst_counter_1 : counter 
  generic map(dim_bit_g => 32)
  port map(reset_a => sig_rst_ac,
           clk => sig_mux_generic_1_out,
           error_out => sig_error_out,
           counter_out => sig_counter_out
    );


---------------------------inst_pp_enable instantiation ---------------------------
-- stores the control bits to select range monitor or single value monitor in event monitor block

  inst_pp_enable : process(clkm,rst_a)
  begin
    if rst_a = '1' then
      sig_en_addr_m <= '0';
      sig_en_addr_s <= '0';
    elsif rising_edge(clkm) then
      if sig_ld_en = '1' then
        sig_en_addr_m <= sig_addr_mx;
        sig_en_addr_s <= sig_addr_sx;
      end if;
    end if;
  end process;

---------------------------inst_pp_out_bus instantiation ---------------------------
--store the output value, ready to be sent to global monitor

  inst_pp_out_bus : process(clkm,rst_a)
  begin
    if rst_a = '1' then
      profiler_result <= (others => '0');
    elsif rising_edge(clkm) then
      if sig_finish = '1' then
        profiler_result <= sig_counter_out;
      end if;
    end if;
  end process;

---------------------------inst_demux_2_1 instantiation---------------------------
--demultiplexer that takes the 32-bit received control frame and propagate toward the right location into the sniffer
  inst_demux_2_1 : demux_2 
  port map(bus_total_in => control_bus_in,
           sel2_in =>sig_sel2 ,
           sup_out => sig_sup_out,
           inf_out => sig_inf_out,
           addr_s_out => sig_demux_2_1_bus_single_out,
           other_out => sig_other
    );
---------------------------inst_msf_decode_1 instantiation---------------------------
-- fsm to perform decode operations
  inst_msf_decode_1 : msf_decode 
  port map(cntrl_st => sig_other (0),
           cntrl_mode_1 => sig_other(1),
           cntrl_mode_2 => sig_other (2),
           cntrl_mode_3 => sig_other(3),
           cntrl_mode_4 => sig_other(4),
           cntrl_mode_5 => sig_other (5),
           cntrl_mode_6 => sig_other (6),
           cntrl_run => sig_other (2),
           cntrl_rst => sig_other(3),
           cntrl_idle => sig_other(4),
           error => sig_error_out,
           clk_m => clkm,
           en_count => sig_en_count_out,
           mod_range => sig_mod_range,
           en_decode => en_decode,
           sel2 => sig_sel2,
           ready => ready,
           ld_inf => sig_ld_inf,
           rst_ac => sig_rst_ac,
           ld_sup => sig_ld_sup,
           ld_single => sig_ld_single,
           run_profiler => sig_run_profiler,
           finish => sig_finish,
           go_idle => go_idle,
           rst_t1 => sig_rst_t1,
           sel3 => sig_sel3,
           addr_mx => sig_addr_mx,
           addr_sx => sig_addr_sx,
           ld_en => sig_ld_en,
           sel4 => sig_sel4
    );
---------------------------sig_mod_Range assignment to enter in range address mode---------------------------
sig_mod_range <= sig_other(0) and
                 sig_other(1) and
                 not sig_other(2) and
                 not sig_other(3) and
                 not sig_other(4) and
                 not sig_other(5) and
                 not sig_other(6);

end rtl;














