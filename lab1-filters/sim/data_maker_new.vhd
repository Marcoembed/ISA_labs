library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity data_maker is
  generic (
    NBIT : integer := 16);
  port (
    CLK     : in  std_logic;
    RST_n   : in  std_logic;
    VOUT    : out std_logic;
    DOUT    : out std_logic_vector(NBIT-1 downto 0);
    B0      : out std_logic_vector(NBIT-1 downto 0);
    B1      : out std_logic_vector(NBIT-1 downto 0);
    B2      : out std_logic_vector(NBIT-1 downto 0);
    B3      : out std_logic_vector(NBIT-1 downto 0);
    A1      : out std_logic_vector(NBIT-1 downto 0);
    A2      : out std_logic_vector(NBIT-1 downto 0);
    END_SIM : out std_logic);
end data_maker;

architecture beh of data_maker is

  constant tco : time := 10 ns;
  constant N_CYC_END_SIM : integer := 11;
  constant LFSR_INIT : integer := 1365;  

  signal sEndSim : std_logic;  
  signal END_SIM_i : std_logic_vector(0 to N_CYC_END_SIM-1);

  signal lfsr : std_logic_vector(11 downto 0);
  signal valid : std_logic;  

begin  -- beh

  B0 <= conv_std_logic_vector(286, NBIT);
  B1 <= conv_std_logic_vector(1571, NBIT);
  B2 <= conv_std_logic_vector(5374, NBIT);
  B3 <= conv_std_logic_vector(9151, NBIT);
  A1 <= conv_std_logic_vector(-711, NBIT);
  A2 <= conv_std_logic_vector(115, NBIT);

  process (CLK, RST_n)
    file fp_in : text open READ_MODE is "./samples.txt";
    variable line_in : line;
    variable x : integer;
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      DOUT <= (others => '0') after tco;      
      VOUT <= '0' after tco;
      sEndSim <= '0' after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if not endfile(fp_in) then
        if (valid = '1') then
          readline(fp_in, line_in);
          read(line_in, x);
          DOUT <= conv_std_logic_vector(x, 16) after tco;
          VOUT <= '1' after tco;
          sEndSim <= '0' after tco;          
        else
          VOUT <= '0' after tco;
          sEndSim <= '0' after tco;
        end if;
      else
        VOUT <= '0' after tco;        
        sEndSim <= '1' after tco;
      end if;
    end if;
  end process;

  process (CLK, RST_n) is
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      valid <= '0' after tco;
      lfsr <= conv_std_logic_vector(LFSR_INIT, 12) after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      lfsr <= (lfsr(0) xor lfsr(1)) & sxt(lfsr(11 downto 2), 11) after tco;
      valid <= lfsr(0) after tco;
    end if;
  end process;

  process (CLK, RST_n)
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      END_SIM_i <= (others => '0') after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      END_SIM_i(0) <= sEndSim after tco;
      END_SIM_i(1 to 10) <= END_SIM_i(0 to 9) after tco;
    end if;
  end process;

  END_SIM <= END_SIM_i(10);  

end beh;
