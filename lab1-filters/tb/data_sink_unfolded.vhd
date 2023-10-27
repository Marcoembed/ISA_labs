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
    DIN3k   : in std_logic_vector(NBIT-1 downto 0);
    DIN3k1  : in std_logic_vector(NBIT-1 downto 0);
    DIN3k2  : in std_logic_vector(NBIT-1 downto 0));  
end data_sink;

architecture beh of data_sink is

begin  -- beh

  process (CLK, RST_n)
    file res_fp : text open WRITE_MODE is "./results_hdl.txt";
    variable line_out : line;
    file fp_in : text open READ_MODE is "./results_c.txt";
    variable line_in : line;    
    variable x3k : integer;
    variable x3k1 : integer;
    variable x3k2 : integer;    
    variable cnt : integer := 0;
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      cnt := 0;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (VIN = '1') then
        write(line_out, conv_integer(signed(DIN3k)));
        writeline(res_fp, line_out);
        write(line_out, conv_integer(signed(DIN3k1)));
        writeline(res_fp, line_out);
        write(line_out, conv_integer(signed(DIN3k2)));
        writeline(res_fp, line_out);        

        if not endfile(fp_in) then
          -----------------------------------------------------
          -- NOTE: it works only if samples contains 3k samples
          -----------------------------------------------------          
          readline(fp_in, line_in);
          read(line_in, x3k);
          readline(fp_in, line_in);
          read(line_in, x3k1);
          readline(fp_in, line_in);
          read(line_in, x3k2);          
          assert conv_integer(signed(DIN3k)) = x3k report "Results are different: index=" & integer'image(cnt) & " 0" & " c=" & integer'image(x3k) & " HDL=" & integer'image(conv_integer(signed(DIN3k)))  severity error;
          assert conv_integer(signed(DIN3k1)) = x3k1 report "Results are different: index=" & integer'image(cnt) & " 1" & " c=" & integer'image(x3k1) & " HDL=" & integer'image(conv_integer(signed(DIN3k1)))  severity error;
          assert conv_integer(signed(DIN3k2)) = x3k2 report "Results are different: index=" & integer'image(cnt) & " 2" & " c=" & integer'image(x3k2) & " HDL=" & integer'image(conv_integer(signed(DIN3k2)))  severity error;          
        else
          assert VIN = '0' report "Reached EOF in results_c.txt" severity error;  
        end if;
        cnt := cnt + 1;
      end if;
    end if;
  end process;

end beh;
