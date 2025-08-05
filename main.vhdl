library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity project is
port(
	clk		: in std_logic;
	reset		: in std_logic;
	entry_cell	: in std_logic;
	exit_cell	: in std_logic;
	want		: in std_logic_vector(7 downto 0);
	current		: out std_logic_vector(7 downto 0);
	maximum		: out std_logic
);
end project;

architecture code of project is
	signal count : unsigned(7 downto 0) := "00000000";
begin
	process(clk, reset)
	begin
		if reset = '1' then
			count <= "00000000";
		elsif rising_edge(clk) then
			if (exit_cell = '1' and count > 0) then
				count <= count - 1;
			elsif (entry_cell = '1' and unsigned(want) > count) then
				count <= count + 1;
			end if;
		end if;
	end process;
	
	current <= std_logic_vector(count);
	maximum <= '1' when count >= unsigned(want) else '0';
end code;
