library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk_gen is
  generic (
    T : time := 10 ns);
  port (
    CLK  : out std_logic;
    RSTn : out std_logic);
end entity clk_gen;

architecture beh of clk_gen is

  signal sClk : std_logic := '1';
  
begin  -- architecture beh

  process is
  begin  -- process
    sClk <= not(sClk);
    wait for T/2;
  end process;

  CLK <= sClk;

  process is
  begin  -- process
    RSTn <= '0';
    wait for 2*T;
    RSTn <= '1';
    wait;
  end process;  

end architecture beh;
