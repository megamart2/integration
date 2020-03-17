-- Company: University of l'Aquila
-- File : time_monitor.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : timer monitor, used to time measure
-- Date, Author, Revision id, Comments
-- 30/04/15 giacomo valente / 0.0 Creation, 
							--TO DO: add comments after each instantiation, each signal and each process
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mux_package.all; --added to consider the mux_package

entity time_monitor is
    Port ( rst_reg_in:in std_logic;
			  run_profiler_in : in  STD_LOGIC;
           during_read_in : in  STD_LOGIC;
           during_write_in : in  STD_LOGIC;
           rst_t1_in : in  STD_LOGIC;
           SEL3_in : in  STD_LOGIC_VECTOR (1 downto 0);
           ld_Stable_in : in  STD_LOGIC;
			  BUS_IN: in  STD_LOGIC_VECTOR (31 downto 0);
			  ld_single_in:in std_logic;
			  BUS_SINGLE_in:in  STD_LOGIC_VECTOR (31 downto 0);
			  
			  event_ok: in STD_LOGIC;
			  
			ld_ac_tm_out : out  STD_LOGIC;
			en_count_out: out std_logic
			  );
end time_monitor;




architecture Behavioral of time_monitor is

------------------------mux_generic declaration-----------------
component mux_generic
	generic(dim_port:positive;
			  no_port: positive);
			  
	port(Input_ports: IN std_logic_vector((dim_port*no_port)-1 downto 0);
		  Sel_port: IN std_logic_vector(width(no_port)-1 downto 0); 
	     Out_port: OUT std_logic_vector(dim_port-1 downto 0));
end component;



	
----------------------------flip_flop_t declaration-------------------------
	COMPONENT flip_flop_t
	PORT(
			  clk_t : in  STD_LOGIC;
			  rst_t_in : in  STD_LOGIC;
			  t_in : in  STD_LOGIC;
    
           t_out : out  STD_LOGIC);
	END COMPONENT;
	
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
		
	-----------------comp_eq declaration------------
	COMPONENT comp_eq
	generic (dim_bus_eq_g:positive);

	PORT(
		comp1_in : IN std_logic_vector (dim_bus_eq_g-1 downto 0);
		comp2_in : IN std_logic_vector (dim_bus_eq_g-1 downto 0);          
		comp_out : OUT std_logic
		);
	END COMPONENT;

----------------------signals --------------------------------------------
signal sig_mux_in_0: std_logic:='0';
signal sig_mux_in_3: std_logic:='0';
signal sig_out_mux_3: std_logic:='0';
signal sig_clk_t_1 : std_logic:='0';
signal sig_in_t_1: std_logic:='0';
signal sig_out_t_1:std_logic:='0';
signal sig_out_sample_2: STD_LOGIC_VECTOR (31 downto 0);
signal sig_out_comp_eq_2:std_logic:='0';
signal sig_out_addr_s_3: STD_LOGIC_VECTOR (31 downto 0);
signal sig_out_d_gen:std_logic:='0';


begin

----------------i_pipo_reg_ffd_1 instantiation ---------------------------
	i_pipo_reg_ffd_1: process (ld_Stable_in, rst_reg_in) --d flip flop that keeps stable value of during_read or during_write
	begin
		if rst_reg_in='1' then
			sig_out_d_gen <= '0';
		elsif rising_edge(ld_Stable_in) then
			if event_ok='1' then
				sig_out_d_gen<= sig_out_mux_3;
			end if;
		end if;
	end process;

------------------------ i_pipo_reg_sample_2 instantiation----------------
	i_pipo_reg_sample_2: process (ld_Stable_in, rst_reg_in)
	begin
		if rst_reg_in='1' then
			sig_out_sample_2 <= (others=>'0');
		elsif rising_edge(ld_Stable_in) then
			sig_out_sample_2<= BUS_IN;
		end if;
	end process;


------------------i_pipo_reg_addr_s_3 instantiation----------------
	i_pipo_reg_addr_s_3: pipo_reg 
	generic map (dim_in_g=>32,
					 dim_out_g=>32)
	PORT MAP(
		clk_reg_in => ld_single_in,
		rst_reg_in => rst_reg_in,
		I_in=> BUS_SINGLE_in,
		O_out => sig_out_addr_s_3
	);

----------------i_comp_eq_1 instantiation---------

	i_comp_eq_1: comp_eq
	generic map (dim_bus_eq_g=>32)
	PORT MAP(
		comp1_in => sig_out_sample_2,
		comp2_in => sig_out_addr_s_3,
		comp_out => sig_out_comp_eq_2
	);



---------------------------i_mux_gen_1 instantiation ----------------------
	i_mux_gen_1: mux_generic 
	generic map (dim_port=>1,
					no_port=>4
					)
	PORT MAP(
		Input_ports(0) => sig_mux_in_0,
		Input_ports(1)=> during_read_in,
		Input_ports(2) => during_write_in,
		Input_ports(3) => sig_mux_in_3,
		Sel_port => SEL3_in,
		Out_port (0)=> sig_out_mux_3
	);

---------------------------- i_fft_1 instantiation-----------------------
	i_fft_1: flip_flop_t PORT MAP(
		t_in => sig_in_t_1,
		clk_t => sig_clk_t_1 ,
		rst_t_in => rst_t1_in,
		t_out => sig_out_t_1
	);
	
	--------------------------------------concurrent assignments ---------------
	---- put signals to GND 
	sig_mux_in_0<='0';
	sig_mux_in_3<='0';
	
	-- clock of ff_t1
	sig_clk_t_1 <=run_profiler_in and sig_out_d_gen and not ld_Stable_in and sig_out_comp_eq_2 and event_ok ;
	
	--input of ff_t1
	sig_in_t_1 <= '1';
	
	--ld_ac_tm_out assignment
	ld_ac_tm_out<=run_profiler_in and sig_out_t_1 and ld_Stable_in;
	
	en_count_out<=sig_out_t_1;
		
end Behavioral;

