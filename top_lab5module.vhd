library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity top is
    port(
        A : in unsigned(3 downto 0);
        B : in unsigned(3 downto 0);
        S : in std_logic_vector(1 downto 0);
        output : out std_logic_vector(6 downto 0)
    );

architecture synth of top is

    component alu is 
        port(
            a : in unsigned(3 downto 0);
            b : in unsigned(3 downto 0);
            s : in std_logic_vector(1 downto 0);
            y : out unsigned(3 downto 0)
        );
    end component;

    component sevenseg is 
        port(
            i : in unsigned(3 downto 0);
	        segments : out std_logic_vector(6 downto 0) 
        );
    
    signal y_out : unsigned(3 downto 0);

begin
    alu_inst : alu
        port map(
            a => A,
            b => B,
            s => S,
            y => y_out
        );

    sevenseg_inst : sevenseg
        port map(
            i => y_out,
            segments => output
        );
end architecture;