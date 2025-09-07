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
      (not a)                                                when "0000",
      (not b)                                                when "0001",
      (a and b)                                              when "0010",
      (a or  b)                                              when "0011",
      (a nand b)                                             when "0100",
      (a nor  b)                                             when "0101",
      (a xor  b)                                             when "0110",
      (a xnor b)                                             when "0111",
      (a)                                                    when "1000",
      (b)                                                    when "1001",
      std_logic_vector(unsigned(a) + 1)                      when "1010",
      std_logic_vector(unsigned(b) + 1)                      when "1011",
      std_logic_vector(unsigned(a) - 1)                      when "1100",
      std_logic_vector(unsigned(b) - 1)                      when "1101",
      std_logic_vector(unsigned(a) + unsigned(b))            when "1110",
      (others => '0')                                        when others;
end architecture;
