library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hex7seg_rom_16x7 is
    port (
        addr : in  std_logic_vector(3 downto 0);
        data : out std_logic_vector(6 downto 0)
    );
end entity;

architecture behavioral of hex7seg_rom_16x7 is
    type rom_t is array (0 to 15) of std_logic_vector(6 downto 0);

    -- bit order: (6..0) = g f e d c b a  (active-low)
    constant ROM : rom_t := (
        0  => "1000000", -- 0
        1  => "1111001", -- 1
        2  => "0100100", -- 2
        3  => "0110000", -- 3
        4  => "0011001", -- 4
        5  => "0010010", -- 5
        6  => "0000010", -- 6
        7  => "1111000", -- 7
        8  => "0000000", -- 8
        9  => "0010000", -- 9
        10 => "0001000", -- A
        11 => "0000011", -- b
        12 => "1000110", -- C
        13 => "0100001", -- d
        14 => "0000110", -- E
        15 => "0001110"  -- F
    );
begin
    process(addr)
        variable idx : integer range 0 to 15;
    begin
        idx  := to_integer(unsigned(addr)); -- binary -> integer index :contentReference[oaicite:4]{index=4}
        data <= ROM(idx);
    end process;
end architecture;
