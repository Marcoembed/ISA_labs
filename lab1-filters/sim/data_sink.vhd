library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity data_sink is
  generic (
    NBIT : integer := 16);
  port (
    CLK   : in std_logic;
    RST_n : in std_logic;
    VIN   : in std_logic;
    DIN   : in std_logic_vector(NBIT-1 downto 0));
end data_sink;

architecture beh of data_sink is

begin  -- beh

  process (CLK, RST_n)
    file res_fp : text open WRITE_MODE is "./results_hdl.txt";
    variable line_out : line;
    file fp_in : text open READ_MODE is "./results_c.txt";
    variable line_in : line;    
    variable x : integer;
    variable cnt : integer := 0;
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      cnt := 0;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (VIN = '1') then
        write(line_out, conv_integer(signed(DIN)));
        writeline(res_fp, line_out);

        if not endfile(fp_in) then
          readline(fp_in, line_in);
          read(line_in, x);
          assert conv_integer(signed(DIN)) = x report "Results are different: index=" & integer'image(cnt) & " c=" & integer'image(x) & " HDL=" & integer'image(conv_integer(signed(DIN)))  severity error;
        else
          assert VIN = '0' report "Reached EOF in results_c.txt" severity error;  
        end if;
        cnt := cnt + 1;
      end if;
    end if;
  end process;

end beh;
