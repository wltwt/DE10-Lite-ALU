library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d1_alu is
	port (
		a, b		:	in std_logic_vector(3 downto 0);
		op_code	:	in std_logic_vector(3 downto 0);
		result	:	out std_logic_vector(3 downto 0)
		);
end entity;

architecture rtl of d1_alu is
begin
	with op_code select
	result <=
		(not a)				when "0000",
		(not b)				when "0001",
		(a and b)			when "0010",
		(others => '0')	when others;
end architecture;

