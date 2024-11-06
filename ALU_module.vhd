library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
  port(
	  a : in unsigned(3 downto 0);
	  b : in unsigned(3 downto 0);
	  s : in std_logic_vector(1 downto 0);
	  y : out unsigned(3 downto 0)
  );
end alu;

architecture synth of alu is

begin
  process(a, b, s)
  begin
    case s is
      when "00" => -- AND operation
        y <= a and b;             
      when "01" =>  -- OR operation
        y <=  a or b;  
        
      when "10" =>  -- Addition
        y <= a + b;
        
      when "11" =>  -- Subtraction
        y <= a - b;
        
     when others => y <= (others => '0');
     
    end case;
  end process;
end;


