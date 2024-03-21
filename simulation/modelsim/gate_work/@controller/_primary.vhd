library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk             : in     vl_logic;
        rd              : in     vl_logic;
        num             : in     vl_logic_vector(3 downto 0);
        pressed         : in     vl_logic;
        sup             : out    vl_logic_vector(31 downto 0);
        reset           : out    vl_logic;
        number          : in     vl_logic_vector(31 downto 0);
        carry           : in     vl_logic;
        bcd             : out    vl_logic_vector(15 downto 0);
        bi              : out    vl_logic;
        enable          : out    vl_logic;
        done            : in     vl_logic
    );
end Controller;
