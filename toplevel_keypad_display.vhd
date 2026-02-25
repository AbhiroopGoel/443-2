library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel_keypad_display is
    port (
        sw  : in  std_logic_vector(15 downto 0);
        an  : out std_logic_vector(7 downto 0);
        seg : out std_logic_vector(6 downto 0)
    );
end entity;

architecture structural of toplevel_keypad_display is
    signal code : std_logic_vector(3 downto 0);
    signal oe   : std_logic;
    signal seg_raw : std_logic_vector(6 downto 0);
begin

    ENC: entity work.priority_encoder_16to4(behavioral)
        port map (
            x  => sw,
            y  => code,
            oe => oe
        );

    ROM: entity work.hex7seg_rom_16x7(behavioral)
        port map (
            addr => code,
            data => seg_raw
        );

    -- anodes: only digit0 used; active-low enable
    an <= (7 downto 1 => '1') & (not oe);

    -- segments: show ROM only when enabled, otherwise force off (all 1s)
    seg <= seg_raw when oe = '1' else (others => '1');

end architecture;
