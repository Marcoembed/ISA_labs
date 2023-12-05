library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb_mem_test is
end tb_mem_test;

architecture stim of tb_mem_test is

  constant Ts : time := 20 ns;
  
  constant tco : time := 1 ns;
  constant tpd : time := 1 ns;
  
  constant cLAST_VAL : std_logic_vector(11 downto 0) := (11 => '0', 0 => '0', others => '1');

  component mem_test is
    port (
      CLK   : in  std_logic;
      RSTn  : in  std_logic;
      WEN   : in  std_logic;
      DIN   : in  std_logic_vector(63 downto 0);
      WADX  : in  std_logic_vector(10 downto 0);
      START : in  std_logic;
      DOUT  : out std_logic_vector(63 downto 0));
  end component;

  signal CLK   : std_logic := '1';
  signal RSTn  : std_logic;
  signal WEN   : std_logic;
  signal DIN   : std_logic_vector(63 downto 0);
  signal WADX  : std_logic_vector(11 downto 0);
  signal START : std_logic;
  signal DOUT  : std_logic_vector(63 downto 0);

  signal sWADX_last_val : std_logic;
  signal sWADX_stop : std_logic;
  
begin  -- architecture stim

  UUT : mem_test
    port map (
      CLK   => CLK,
      RSTn  => RSTn,
      WEN   => WEN,
      DIN   => DIN,
      WADX  => WADX(10 downto 0),
      START => START,
      DOUT  => DOUT);

  process is
  begin  -- process
    CLK <= not(CLK);
    wait for 20 ns;
  end process;

  process is
  begin  -- process
    RSTn <= '0';
    wait for 7 ns;
    RSTn <= '1';
    wait;
  end process;

  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      WADX <= (others => '1') after tco;
      WEN <= '0' after tco;
      DIN <= (others => '0') after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (sWADX_stop = '0') then
        WADX <= WADX + '1' after tco;
        WEN <= '1' after tco;
        DIN <= DIN + '1' after tco;
      else
        WADX <= (11 => '1', others => '0') after tco;
        WEN <= '0' after tco;
      end if;
    end if;
  end process;

  sWADX_last_val <= '1' after tpd when (WADX = cLAST_VAL) else '0' after tpd;

  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      sWADX_stop <= '0' after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (sWADX_last_val = '1') then
        sWADX_stop <= '1' after tco;
      end if;
    end if;
  end process;

  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      START <= '0' after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      START <= sWADX_last_val after tco;
    end if;
  end process;
  
end stim;
