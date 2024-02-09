library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity data_dumper is
  
  port (
    CLK  : in std_logic;
    RSTn : in std_logic;
    RDATA : in std_logic_vector(31 downto 0);
    VALID : in std_logic);

end entity data_dumper;

architecture beh of data_dumper is

begin  -- architecture beh

  process (CLK, RSTn) is
    file fp_out : text open WRITE_MODE is "./from_mem.hex";    
    variable line_out : line;    
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      null;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (VALID = '1') then
        hwrite(line_out, RDATA);                          
        writeline(fp_out, line_out);
      end if;
    end if;
  end process;  

end architecture beh;
