library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sevenseg is
  port(
	  i : in unsigned(3 downto 0);
	  segments : out std_logic_vector(6 downto 0)
  );
end sevenseg;

architecture synth of sevenseg is
begin
    process(i)
    begin
        case i is
            when "0000" => segments <= "1000000"; -- 0 display
            when "0001" => segments <= "1111001"; -- 1 display 
            when "0010" => segments <= "0100100"; -- 2 display  
            when "0011" => segments <= "0110000"; -- 3 display  
            when "0100" => segments <= "0011001"; -- 4 display 
            when "0101" => segments <= "0010010"; -- 5 display  
            when "0110" => segments <= "0000010"; -- 6 display 
            when "0111" => segments <= "1111000"; -- 7 display 
            when "1000" => segments <= "0000000"; -- 8 display 
            when "1001" => segments <= "0010000"; -- 9 display 
            when others => segments <= "1111111"; -- Default off
        end case;
    end process;
end;