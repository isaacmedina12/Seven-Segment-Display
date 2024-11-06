library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity top is
  port(
        V : in unsigned( 5 downto 0);
	  display : out std_logic_vector(6 downto 0);
      digitone: out std_logic;
      digittwo : out std_logic
  );
end top;

architecture synth of top is
    signal clk : std_logic;
    signal counter : unsigned(25 downto 0) := (others => '0');
    signal displayten : std_logic_vector(6 downto 0);
    signal displayone : std_logic_vector(6 downto 0);

    component HSOSC is
        generic (
            CLKHF_DIV : String := "00"); 
            port(
                CLKHFPU : in std_logic := 'X'; -- Set to 1 to power up
                CLKHFEN : in std_logic := 'X'; -- Set to 1 to enable output
                CLKHF : out std_logic := 'X'); -- Clock output
    end component;

    component DDDD is 
        port(
            v : in unsigned(5 downto 0);
            tensdigit : out std_logic_vector(6 downto 0);
            onesdigit : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    
    osc : HSOSC generic map ( CLKHF_DIV => "0b00")
        port map (CLKHFPU => '1',
            CLKHFEN => '1',
            CLKHF => clk);

    DDDD_inst : DDDD
        port map(
            v => V,
            tensdigit => displayten,
            onesdigit => displayone);

    process (clk) is
    begin
        if rising_edge(clk) then 
            counter <= counter + 1;
            digitone <= counter(16);
            digittwo <= not counter(16);
        end if;
    end process;
    display <= displayten when (digitone) else displayone;
end;