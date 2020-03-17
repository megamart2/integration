
----------------------------------------------------------------------------------
-- Company: University of l'Aquila
-- File : mux_package.vhd
-- Project Name : CRAFTERS 
-- FPGA : 
-- Function : package to define smart mux
-- Date, Author, Revision id, Comments
--  2/4/15 giacomo valente / 0.0 Creation 
-- JJ-MM-AA [DESIGNER_NAME] / x.x insert comments
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use IEEE.MATH_REAL.ALL;

package mux_package is   

---------------------------functions declaration--------------------------
function width( i: in positive) return positive;
function bin_to_int (i: in std_logic_vector) return integer;

end mux_package;


package body mux_package is

---------------------function width definition----------------------------
-----description: returns logarithm of passed i
-----inputs:i
-----outputs:logvar, the log2(i)

function width( i: in positive) return positive is
	variable logvar : real;
	variable powvar : positive;
	variable var: real;
	constant two: real :=2.0;
begin
	var := real(i);
	logvar := CEIL(LOG(var, two));
	powvar := positive(2**logvar);
	
	if (powvar < i) then
		logvar := logvar + 1.0;
	
		assert FALSE
		report "Number of ports isn't power of 2"
		severity WARNING;
	end if;

return (positive(logvar));
end width;
 


---------------------function bin_to_int definition----------------------------
-----description: conversion from binary to decimal integer
-----inputs:i (binary)
-----outputs: temp,decimal value of i

function bin_to_int (i: in std_logic_vector) return integer is
	variable temp: integer := 0;
begin
	for k in i'range loop
		if (i(k)='1') then
		temp := temp + 2**k;
		end if;
	end loop;
	return temp;
end bin_to_int;



end mux_package;
