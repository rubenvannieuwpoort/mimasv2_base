library ieee;
use ieee.std_logic_1164.all;

entity main is
	port (
		clk_in: in std_logic;
		dp_switch: in std_logic_vector(7 downto 0);
		push_switch: in std_logic_vector(5 downto 0);
		
		led: out std_logic_vector(7 downto 0);
		seven_segment: out std_logic_vector(7 downto 0);
		seven_segment_enable: out std_logic_vector(2 downto 0);
		audio: out std_logic_vector(1 downto 0);
		vga_hsync: out std_logic;
		vga_vsync: out std_logic;
		vga_r: out std_logic_vector(2 downto 0);
		vga_g: out std_logic_vector(2 downto 0);
		vga_b: out std_logic_vector(2 downto 1);
		
		io_p6: inout std_logic_vector(7 downto 0);
		io_p7: inout std_logic_vector(7 downto 0);
		io_p8: inout std_logic_vector(7 downto 0);
		io_p9: inout std_logic_vector(7 downto 0)

	);
end main;

architecture Behavioral of main is

	signal clk, clk_generated: std_logic;

	component clock_generator
	port (
		clk_in: in std_logic;
		clk_out : out std_logic
	);
	end component;
	
	component clock_divider
	generic (
		n: integer
	);
	port (
		clk_in: in std_logic;
		clk_out : out std_logic
	);
	end component;
	
	component blink
	port (
		clk: in std_logic;
		led: out std_logic
	);
	end component;
	
begin

	led(7 downto 1) <= "0000000";
	seven_segment <= "11111111";
	seven_segment_enable <= "000";
	audio <= "00";
	vga_hsync <= '0';
	vga_vsync <= '0';
	vga_r <= "000";
	vga_g <= "000";
	vga_b <= "00";
		
	-- clocking
	clock_div: clock_divider generic map(n => 26) port map(clk_in => clk_in, clk_out => clk);
	
	-- blink component
	blinkie: blink port map(clk => clk, led => led(0));

end Behavioral;
