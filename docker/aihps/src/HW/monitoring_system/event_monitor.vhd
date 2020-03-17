
-- Company: University of l'Aquila
-- File : event_monitor.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : event monitor, used to count events
-- Date, Author, Revision id, Comments
-- 30/04/15 Giacomo / 0.1 Creation
							--adapted to 32 bit by enhancing 16-bits blocks
							-- TO DO add comments after each instantiation, each signal and each process
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity event_monitor is
    port (ld_inf_in:in std_logic;
          ld_sup_in: in std_logic;
          BUS_SUP_in:in std_logic_vector (31 downto 0);
          BUS_INF_in:in std_logic_vector (31 downto 0);
          rst_reg_in: in std_logic;
          BUS_in: in std_logic_Vector (31 downto 0);
          run_profiler_in: in std_logic;
          event_ok_in: in std_logic;
          BUS_SINGLE_in:in std_logic_vector (31 downto 0);
          ld_single_in: in std_logic;
          ld_stable_in:in std_logic;
          en_addr_m_in: in std_logic;
          en_addr_s_in: in std_logic;
          ld_ac_event_out: out std_logic
    );
end event_monitor;

architecture Behavioral of event_monitor is
------------------------------pipo_reg declaration --------------------
  COMPONENT pipo_reg
  generic (dim_in_g:positive:=32; --set the register dimension
           dim_out_g:positive:=32 --set the output dimension
      );
  PORT(clk_reg_in : IN std_logic;
       rst_reg_in : IN std_logic;
       I_in: IN std_logic_vector(dim_in_g-1 downto 0);          
       O_out : OUT std_logic_vector(dim_out_g-1 downto 0)
      );
  END COMPONENT;
--------------------------comp_lt declaration----------------------------
  COMPONENT comp_lt
    generic (dim_bus_lt_g:positive:=32); --dimension of the lt comparator
    PORT(BUS_IN : IN std_logic_vector(dim_bus_lt_g-1 downto 0);
         F_SUP_in : IN std_logic_vector(dim_bus_lt_g-1 downto 0);          
         MIN_out : OUT std_logic
        );
  END COMPONENT;
------------------comp_gt declaration------------------------------------
  
  COMPONENT comp_gt
  generic (dim_bus_gt_g:positive:=32); --dimension of the lt comparator
  PORT(BUS_IN : IN std_logic_vector(dim_bus_gt_g-1 downto 0);
       F_MIN_in : IN std_logic_vector(dim_bus_gt_g-1 downto 0);          
       MAG_out : OUT std_logic
    );
  END COMPONENT;
----------------------comp_eq declaration--------------------------------
  COMPONENT comp_eq
    generic (dim_bus_eq_g:positive);
    PORT(comp1_in : IN std_logic_vector (dim_bus_eq_g-1 downto 0);
         comp2_in : IN std_logic_vector (dim_bus_eq_g-1 downto 0);          
         comp_out : OUT std_logic
    );
  END COMPONENT;

--------------------------------------signals -----------------------------------------------------
signal sig_out_sup:std_logic_vector (31 downto 0):=(others=>'0');
signal sig_out_inf:std_logic_vector (31 downto 0):=(others=>'0');
signal sig_out_sample:std_logic_vector (31 downto 0):=(others=>'0');
signal sig_out_single:std_logic_vector (31 downto 0):=(others=>'0');
signal sig_min:std_logic:='0';
signal sig_mag:std_logic:='0';
signal sig_eq:std_logic:='0';
signal sig_ld_ac_range:std_logic:='0';
signal sig_ld_ac_single:std_logic:='0';
signal sig_out_event:std_logic:='0';
    
------------------------------begin architecture ----------------------------------------------------
begin
------------------- i_pipo_reg_ffd_1 instantiation -----------------------
    i_pipo_reg_ffd_1: pipo_reg 
    generic map (dim_in_g=>1,
                 dim_out_g=>1)
    PORT MAP(
        clk_reg_in => ld_stable_in,
        rst_reg_in => rst_reg_in,
        I_in (0)=> event_ok_in,
        O_out (0)=> sig_out_event
    );

--------------------i_pipo_reg_sup_4 instantiation-------------------------------
    i_pipo_reg_sup_1: pipo_reg 
    generic map (dim_in_g=>32,
                 dim_out_g=>32)
    PORT MAP(
        clk_reg_in => ld_sup_in,
        rst_reg_in => rst_reg_in,
        I_in => BUS_SUP_in,
        O_out  => sig_out_sup
    );

----------------------i_pipo_reg_inf_5 instantiation -------------------------------
    i_pipo_reg_inf_5: pipo_reg 
    generic map (dim_in_g=>32,
                 dim_out_g=>32)
    PORT MAP(
        clk_reg_in => ld_inf_in,
        rst_reg_in => rst_reg_in,
        I_in => BUS_INF_in,
        O_out  => sig_out_inf
    );


----------------------i_pipo_reg_sample_2 instantiation -------------------------------
    i_pipo_reg_sample_2: pipo_reg 
    generic map (dim_in_g=>32,
                 dim_out_g=>32)
    PORT MAP(
        clk_reg_in => ld_stable_in,
        rst_reg_in => rst_reg_in,
        I_in => bus_in,
        O_out => sig_out_sample
    );
    

    
    
    
----------------------i_pipo_reg_addr_s_3 instantiation-------------------------------
    i_pipo_reg_addr_s_3: pipo_reg 
    generic map (dim_in_g=>32,
                     dim_out_g=>32)
    PORT MAP(
        clk_reg_in => ld_single_in,
        rst_reg_in => rst_reg_in,
        I_in => BUS_SINGLE_in,
        O_out=> sig_out_single
    );
    

----------------------i_comp_lt_1 instantiation-------------------------------

    i_comp_lt_1: comp_lt 
    generic map (dim_bus_lt_g=>32)
    PORT MAP(
        BUS_IN => sig_out_sample,
        F_SUP_in =>sig_out_sup ,
        MIN_out => sig_min
    );
    
    
----------------------i_comp_mg_1 instantiation -------------------------------
    i_comp_mg_1: comp_gt
    generic map (dim_bus_gt_g=>32)
    PORT MAP(
        BUS_IN => sig_out_sample,
        F_MIN_in => sig_out_inf,
        MAG_out => sig_mag
    );
----------------------i_comp_eq_1 instantiation-------------------------------

    i_comp_eq_1: comp_eq
    generic map (dim_bus_eq_g=>32)
    PORT MAP(
        comp1_in => sig_out_sample,
        comp2_in => sig_out_single,
        comp_out => sig_eq
    );
    

    --------------------------------concurrent assignments ------------------------------
sig_ld_ac_range<=sig_out_event and sig_min and sig_mag and run_profiler_in and en_addr_m_in and not ld_stable_in;

sig_ld_ac_single<=sig_out_event and sig_eq and run_profiler_in and en_addr_s_in and not ld_stable_in;

ld_ac_event_out<=sig_ld_ac_range or sig_ld_ac_single;
    

end Behavioral;

