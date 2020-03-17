

----------------------------------------------------------------------------------
-- Company: University of l'Aquila
-- File : msf_decode.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : finite state machine for decode
-- Date, Author, Revision id, Comments
-- 6/3/15 Giacomo Valente / 0.0 Creation 									
									-- TO DO: add comments after each instantiation, each signal and each process
									--need to be enhanced and reviewed
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity msf_decode is
    Port ( cntrl_st : in  STD_LOGIC;
           cntrl_mode_1 : in  STD_LOGIC;
           cntrl_mode_2 : in  STD_LOGIC;
           cntrl_mode_3 : in  STD_LOGIC;
           cntrl_mode_4 : in  STD_LOGIC;
           cntrl_mode_5 : in  STD_LOGIC;
           cntrl_mode_6 : in  STD_LOGIC;
           cntrl_run : in  STD_LOGIC;
           cntrl_rst : in  STD_LOGIC;
           cntrl_idle : in  STD_LOGIC;
           en_decode : in  STD_LOGIC;
           error : in  STD_LOGIC;
           clk_m : in  STD_LOGIC;
           en_count : in  STD_LOGIC;
			  mod_range:in std_logic;
			  
           SEL2 : out  STD_LOGIC_VECTOR (1 downto 0);
           ready : out  STD_LOGIC;
           ld_inf : out  STD_LOGIC;
           rst_ac : out  STD_LOGIC;
           ld_sup : out  STD_LOGIC;
           ld_single : out  STD_LOGIC;
           run_profiler : out  STD_LOGIC;
           finish : out  STD_LOGIC;
           go_idle : out  STD_LOGIC;
           rst_t1 : out  STD_LOGIC;
           sel3 : out  STD_LOGIC_VECTOR (1 downto 0);
			  addr_mx: out  STD_LOGIC;
			  addr_sx: out  STD_LOGIC;
			  ld_en: out  STD_LOGIC;
			  sel4: out  STD_LOGIC

				);
end msf_decode;


------------------------------------------------------------------------------------
architecture Behavioral of msf_decode is

type state is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37,s38,s39,s40,s41,s42,s43,s44,s45,s46,s47,s48,s49,s50,s51,s52,s53,s54,s55,s56,s57,s58);
signal current_state: state:=s0;
signal next_state: state:=s0;

begin

comb: process (mod_range,current_state, cntrl_st,cntrl_mode_1,cntrl_mode_2,cntrl_mode_3,cntrl_mode_4,cntrl_mode_5,cntrl_mode_6,cntrl_run,cntrl_rst,cntrl_idle,en_decode,error,en_count)
begin
	case current_state is
		
				
		when s0 =>
           SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
		
				
			  
			  if en_decode='1' then 
					if cntrl_st='1' then 
						next_state<=s1; 
					else
						next_state<=s0; 
					end if;
				else
					next_state<=s0;
				end if;
				
			
		when s1=> --reset of t flip flop
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='1';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
			

				if (cntrl_mode_1 or cntrl_mode_2) ='0' then
					next_state<=s2; 
				else 
					if mod_range='1' then 
						next_state<=s3; 
					else
						next_state<=s7; 
					end if;
				end if;

			  
		when s2=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='1';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
			
				if (cntrl_mode_3) ='1' then
					next_state<=s17; 
				else 
					next_state<=s27; 
				end if;
				

		when s3=> --mode range monitor
			  SEL2 <="10";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='1';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
			
				if (en_decode) ='1' then
					next_state<=s4; 
				else 
					next_state<=s3; 
				end if;
				
				
		when s4 => 
			  SEL2 <="10";
           ready<= '0';
           ld_inf <='1';
           rst_ac <='1';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='1';
				addr_sx<='0';
				ld_en<='1';
				sel4<='0';
				
			  next_state<=s5; 
			  
			  
		when s5=> 
			  SEL2 <="11";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
				if (en_decode) ='1' then
					next_state<=s6; 
				else 
					next_state<=s5; 
				end if;
				
				
		when s6=> 
			  SEL2 <="11";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='1';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
				next_state<=s11;
				
				
			
		when s7=> 
			  SEL2 <="01";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='1';
				ld_en<='0';
				sel4<='0';
				
				if (en_decode) ='1' then
					next_state<=s8; 
				else 
					next_state<=s7; 
				end if;			
				
				
		when s8 => 
			  SEL2 <="01";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='1';
           ld_sup <='0';
           ld_single <='1';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='1';
				ld_en<='1';
				sel4<='0';
				
			  next_state<=s9; 
			  
			  
		when s9=> 
			  SEL2 <="01";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
				if (en_decode) ='1' then
					next_state<=s10; 
				else 
					next_state<=s9;
				end if;
				
				
		when s10 => 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
			  next_state<=s11; 
			  
				
		when s11=> 
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
				if (en_decode) ='1' then
					next_state<=s12; 
				else 
					next_state<=s11; 
				end if;
				
				
		when s12=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
				if (cntrl_run or cntrl_rst) ='1' then
					if cntrl_run ='1' then
						next_state<=s13; 
					else 
						next_state<=s15;
					end if;
				else
					next_state<=s11;
				end if;
				
				
		when s13=> 
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='1';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
				if (error) ='1' then
					next_state<=s15; 
				else 
					if en_decode = '1' then
						next_State<=s14;
					else
						next_State<=s13;
					end if;
				end if;
				
			
		when s14 => 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
			  next_state<=s15; 
				
				
		when s15 => 
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '1';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
				if (en_decode and cntrl_idle) ='1' then
					next_state<=s16; 
				else 
					next_state<=s15; 
				end if;
				
			
		when s16 => 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='1';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
			  next_state<=s0; 
			  
			  
		when s17=> 
			  SEL2 <="01";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode) ='1' then
					next_state<=s18; 
				else 
					next_state<=s17; 
				end if;
				
				
		when s18=> 
			  SEL2 <="01";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='1';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
			  next_state<=s19;  
			  
		
		when s19=> 
			  SEL2 <="01";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode) ='1' then
					next_state<=s20; 
				else 
					next_state<=s19; 
				end if;
				

		when s20=>
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
			  next_state<=s21;  
				
				
		when s21=> 
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode) ='1' then
					next_state<=s22; 
				else 
					next_state<=s21; 
				end if;
				
				
				
		
		when s22=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (cntrl_run) ='1' then
					next_state<=s23;
				else 
					next_state<=s21; 
				end if;		
				

		when s23=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='1';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="01";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_count) ='1' then
					next_state<=s24; 
				else 
					next_state<=s23; 
				end if;	
			
			
		when s24=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='1';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="01";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (not en_count) ='1' then
					next_state<=s25; 
				else 
					next_state<=s24; 
				end if;	
				
				
		when s25=> 
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode) ='1' then
					next_state<=s26; 
				else 
					next_state<=s25; 
				end if;	
				
				
		when s26=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
			  next_state<=s15;  
			  
			  
		when s27=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (cntrl_mode_4)='1' then
					next_state<=s28; 
				else
					next_state<= s38; 
				end if;
				
				
		when s28=> 
			  SEL2 <="01";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode) ='1' then
					next_state<=s29; 
				else 
					next_state<=s28; 
				end if;	
				
	
		when s29=> 
			  SEL2 <="01";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='1';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
			next_state<=s30;
				
		
		when s30=> 
			  SEL2 <="01";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode)='1' then
					next_state<=s31; 
				else
					next_state<=s30; 
				end if;



		when s31=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				next_state<=s32; 
				
				
				
		when s32=> 
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode)='1' then
					next_state<=s33;
				else
					next_state<=s32; 
				end if;
				
			
		when s33=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (cntrl_run)='1' then
					next_state<=s34;
				else
					next_state<= s32; 
				end if;		
				





		when s34=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='1';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="10";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_count)='1' then
					next_state<=s35; 
				else
					next_state<= s34; 
				end if;





		when s35=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='1';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="10";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if ( not en_count)='1' then
					next_state<=s36; 
				else
					next_state<= s35; 
				end if;




		when s36=>
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode)='1' then
					next_state<=s37; 
				else
					next_state<= s36; 
				end if;




		when s37=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				next_state<=s15;





		when s38=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (cntrl_mode_5)='1' then
					next_state<=s39; 
				else
					next_state<= s49; 
				end if;
				




		when s39=> 
			  SEL2 <="01";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode)='1' then
					next_state<=s40; 
				else
					next_state<= s39; 
				end if;





		when s40=> 
			  SEL2 <="01";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='1';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				next_state<=s41;





		when s41=> 
			  SEL2 <="01";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if ( en_decode)='1' then
					next_state<=s42; 
				else
					next_state<= s41; 
				end if;





		when s42=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				next_state<=s43;





		when s43=>
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode)='1' then
					next_state<=s44; 
				else
					next_state<= s43; 
				end if;




		when s44=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (cntrl_run)='1' then
					next_state<=s45; 
				else
					next_state<= s43; 
				end if;




		when s45=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='1';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="01";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_count)='1' then
					next_state<=s46; 
				else
					next_state<= s45; 
				end if;




		when s46=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='1';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="10";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (not en_count)='1' then
					next_state<=s47; 
				else
					next_state<= s46; 
				end if;




		when s47=> 
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode)='1' then
					next_state<=s48; 
				else
					next_state<= s47; 
				end if;			




		when s48=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<= '1';
				
			next_state<=s15;
			
				

		when s49=> 
			  SEL2 <="01";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode)='1' then
					next_state<=s50; 
				else
					next_state<= s49; 
				end if;				



		when s50=> 
			  SEL2 <="01";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='1';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				next_state<=s51;



		when s51=> 
			  SEL2 <="01";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode)='1' then
					next_state<=s52; 
				else
					next_state<=s51; 
				end if;
				
				
				
				
		when s52=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<= '1';
				
			next_state<=s53; 
			
			
			
		when s53=> 
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode)='1' then
					next_state<=s54; 
				else
					next_state<=s53; 
				end if;



		when s54=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (cntrl_run)='1' then
					next_state<=s55; 
				else
					next_state<=s53; 
				end if;			
			
			
		when s55=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='1';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="10";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_count)='1' then
					next_state<=s56; 
				else
					next_state<=s55; 
				end if;	



		when s56=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='1';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="01";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (not en_count)='1' then
					next_state<=s57; 
				else
					next_state<=s56; 
				end if;			
			
			
		when s57=> 
			  SEL2 <="00";
           ready<= '1';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
				if (en_decode)='1' then
					next_state<=s58; 
				else
					next_state<=s57; 
				end if;	
			
			
		when s58=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='1';
				
			next_state<=s15; 
			
			
			

		when others=> 
			  SEL2 <="00";
           ready<= '0';
           ld_inf <='0';
           rst_ac <='0';
           ld_sup <='0';
           ld_single <='0';
           run_profiler <='0';
           finish<= '0';
           go_idle <='0';
           rst_t1 <='0';
           sel3 <="00";	
			  addr_mx<='0';
				addr_sx<='0';
				ld_en<='0';
				sel4<='0';
				
				next_state<=s0; 
				end case;
	
end process;






evoluzione: process (clk_m)
begin
	if rising_edge (clk_m) then
		current_state<=next_state;
	end if;
end process;


end Behavioral;



