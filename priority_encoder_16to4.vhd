library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity priority_encoder_16to4 is
    port (
        x  : in  std_logic_vector(15 downto 0);
        y  : out std_logic_vector(3 downto 0);
        oe : out std_logic
    );
end entity;

architecture behavioral of priority_encoder_16to4 is
begin
    process(x)
    begin
        y  <= (others => '0');
        oe <= '0';

        -- Highest index wins (15..0)
        for i in 15 downto 0 loop
            if x(i) = '1' then
                y  <= std_logic_vector(to_unsigned(i, 4));
                oe <= '1';
                exit;
            end if;
        end loop;
    end process;
end architecture;
