library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mem_test is
  port (
    CLK     : in  std_logic;
    RSTn    : in  std_logic;
    WEN     : in  std_logic;
    DIN     : in  std_logic_vector(63 downto 0);
    WADX    : in  std_logic_vector(10 downto 0);
    START   : in  std_logic;
    DOUT    : out std_logic_vector(63 downto 0));
end mem_test;

architecture beh of mem_test is

  constant tco : time := 1 ns;
  constant tpd : time := 1 ns;

  constant cLAST_ADX : std_logic_vector(10 downto 0) := (others => '1');
  
  component sram_32_1024_freepdk45 is
    port (
      clk0 : in std_logic;
      csb0 : in std_logic;
      web0 : in std_logic;
      addr0 : in std_logic_vector(9 downto 0);
      din0  : in std_logic_vector(31 downto 0);
      dout0 : out std_logic_vector(31 downto 0));
  end component;

  signal sSTART_reg : std_logic;
  signal sSTART_reg2 : std_logic;  
  signal sWEN_reg : std_logic;
  signal sDIN_reg : std_logic_vector(63 downto 0);
  signal sWADX_reg : std_logic_vector(10 downto 0);

  signal sRWn : std_logic;

  signal s_is_a : std_logic;
  signal s_is_b : std_logic;  
  signal s_is_a_reg : std_logic;  
  signal s_csb_a : std_logic;
  signal s_web_a : std_logic;
  signal s_csb_b : std_logic;
  signal s_web_b : std_logic;  
  signal s_addr : std_logic_vector(9 downto 0);
  signal s_radx : std_logic_vector(10 downto 0);
  signal s_dout_a0 : std_logic_vector(31 downto 0);
  signal s_dout_a1 : std_logic_vector(31 downto 0);
  signal s_dout_b0 : std_logic_vector(31 downto 0);
  signal s_dout_b1 : std_logic_vector(31 downto 0);    

  signal s_radx_stop : std_logic;

  signal s_value : std_logic_vector(63 downto 0);
  signal s_sum : std_logic_vector(63 downto 0);
  signal s_result : std_logic_vector(63 downto 0);  
  
begin  -- architecture beh

  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      sWEN_reg <= '0' after tco;
      sDIN_reg <= (others => '0') after tco;
      sWADX_reg <= (others => '0') after tco;
      sSTART_reg <= '0' after tco;
      sSTART_reg2 <= '0' after tco;      
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      sWEN_reg <= WEN after tco;
      sDIN_reg <= DIN after tco;
      sWADX_reg <= WADX after tco;
      sSTART_reg <= START after tco;
      sSTART_reg2 <= sSTART_reg after tco;
    end if;
  end process;

  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      sRWn <= '0' after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (sSTART_reg = '1') then
        sRWn <= '1' after tco;
      else
        if (s_radx_stop = '1') then
          sRWn <= '0' after tco;
        end if;
      end if;
    end if;
  end process;

  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      s_radx <= (others => '0') after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (sSTART_reg = '1') then
        s_radx <= (others => '0') after tco;
      else
        if (sRWn = '1' and s_radx_stop = '0') then
          s_radx <= s_radx + '1' after tco;
        end if;        
      end if;
    end if;
  end process;

  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      s_radx_stop <= '0' after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (sSTART_reg = '1') then
        s_radx_stop <= '0' after tco;
      else
        if (s_radx = cLAST_ADX) then
          s_radx_stop <= '1' after tco;
        end if;        
      end if;
    end if;
  end process;

  s_is_a <= not(sWADX_reg(10)) and not(s_radx(10)) after tpd;
  s_is_b <= sWADX_reg(10) or s_radx(10) after tpd;
  
  s_web_a <= not(s_is_a and not(sRWn) and sWEN_reg) after tpd;
  s_web_b <= not(s_is_b and not(sRWn) and sWEN_reg) after tpd;
  
  s_csb_a <= not(s_is_a and (sWEN_reg or sRWn)) after tpd;
  s_csb_b <= not(s_is_b and (sWEN_reg or sRWn)) after tpd;
  
  s_addr <= sWADX_reg(9 downto 0) after tpd when (sRWn = '0') else
            s_radx(9 downto 0) after tpd; 

  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      s_is_a_reg <= '0' after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      s_is_a_reg <= s_is_a after tco;
    end if;
  end process;
  
  ia0 : sram_32_1024_freepdk45
    port map (
      clk0  => CLK,
      csb0  => s_csb_a,
      web0  => s_web_a,
      addr0 => s_addr,
      din0  => sDIN_reg(31 downto 0),
      dout0 => s_dout_a0);

  ia1 : sram_32_1024_freepdk45
    port map (
      clk0  => CLK,
      csb0  => s_csb_a,
      web0  => s_web_a,
      addr0 => s_addr,
      din0  => sDIN_reg(63 downto 32),
      dout0 => s_dout_a1);

  ib0 : sram_32_1024_freepdk45
    port map (
      clk0  => CLK,
      csb0  => s_csb_b,
      web0  => s_web_b,
      addr0 => s_addr,
      din0  => sDIN_reg(31 downto 0),
      dout0 => s_dout_b0);

  ib1 : sram_32_1024_freepdk45
    port map (
      clk0  => CLK,
      csb0  => s_csb_b,
      web0  => s_web_b,
      addr0 => s_addr,
      din0  => sDIN_reg(63 downto 32),
      dout0 => s_dout_b1);

  s_value <= s_dout_a1 & s_dout_a0 after tpd when (s_is_a_reg = '1') else s_dout_b1 & s_dout_b0 after tpd;

  s_sum <= s_result + s_value after tpd;

  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      s_result <= (others => '0') after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (sSTART_reg2 = '1') then
        s_result <= (others => '0') after tco;
      else
        if (s_radx_stop = '0') then
          s_result <= s_sum after tco;
        end if;
      end if;
    end if;
  end process;

  DOUT <= s_result;
  
end beh;
