library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity req_gen_fast is
  generic (
    CONTENT_TYPE : integer := 0;
    tco : time := 1 ns;
    tpd : time := 1 ns);        
  port (
    CLK      : in  std_logic;
    RSTn     : in  std_logic;
    PROC_REQ : out std_logic;
    MEM_RDY  : in std_logic;
    WE       : out std_logic;
    ADDR     : out std_logic_vector(31 downto 0);
    WDATA    : out std_logic_vector(31 downto 0));
end entity req_gen_fast;

architecture beh of req_gen_fast is

  -- constant tpd : time := 1 ns;
  -- constant tco : time := 1 ns;

    -- address offset initialization
  impure function fInit_offset (
    constant CT : integer)
    return std_logic_vector is
    file fp0_in : text open READ_MODE is "./text_init.hex";
    file fp1_in : text open READ_MODE is "./data_init.hex";    
    variable line_in : line;    
    variable value : std_logic_vector(31 downto 0) := (others => '0');
  begin  -- function fInit_offset
    case CT is
      when 0 =>
        if not endfile(fp0_in) then
          readline(fp0_in, line_in);
          hread(line_in, value);          
        end if;
      when 1 =>
        if not endfile(fp1_in) then
          readline(fp1_in, line_in);
          hread(line_in, value);          
        end if;                  
      when others => null;
    end case;
    return value;    
  end function fInit_offset;

  type tState is (RST_S, IDLE_S, REQ_ON_S, WAIT_RDY_S, REQ_OFF_S);
  signal sState : tState;  

  signal sLFSR_WE_reg : std_logic_vector(2 downto 0);
  signal sLFSR_WE_fb : std_logic;
  
  signal sAddr : std_logic_vector(31 downto 0);
  signal sProc_req : std_logic;
  
begin  -- architecture beh

  -----------------------------------------------------------------------------
  -- ADDR generation
  -----------------------------------------------------------------------------  
  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      sAddr <= fInit_offset(CONTENT_TYPE);
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (sProc_req = '1' and MEM_RDY = '1') then
        sAddr <= sAddr + conv_std_logic_vector(4, 32) after tco;
      end if;
    end if;
  end process;

  ADDR <= sAddr;

  -----------------------------------------------------------------------------
  -- WE and WDATA generation
  -----------------------------------------------------------------------------
  -- LFSR
  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      sLFSR_WE_reg <= (others => '1');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (sProc_req = '1' and MEM_RDY = '1') then      
        sLFSR_WE_reg(2) <= sLFSR_WE_fb after tco;
        sLFSR_WE_reg(1 downto 0) <= sLFSR_WE_reg(2 downto 1) after tco;
      end if;
    end if;
  end process;

  -- LFSR feedback
  sLFSR_WE_fb <= sLFSR_WE_reg(2) xor sLFSR_WE_reg(0) after tpd;    

  -- WE and WDATA
  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      WE <= '0';
      WDATA <= (others => '0');      
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (CONTENT_TYPE = 0) then
        WE <= '0' after tco;
        WDATA <= (others => '0') after tco;
      else
        WE <= not(sLFSR_WE_reg(0)) after tco;
        if (sLFSR_WE_reg(0) = '1') then
          WDATA <= (others => '0') after tco;
        else
          WDATA <= sAddr after tco;
        end if;
      end if;
    end if;
  end process;  

  -----------------------------------------------------------------------------
  -- PROC_REQ generation (always REQ)
  -----------------------------------------------------------------------------    
  process (CLK, RSTn) is
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      sProc_req <= '0';
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      sProc_req <= '1' after tco;
    end if;
  end process;

  PROC_REQ <= sProc_req;

end architecture beh;
