library verilog;
use verilog.vl_types.all;
entity Counter is
    port(
        clk             : in     vl_logic;
        sup             : in     vl_logic_vector(31 downto 0);
        duration        : in     vl_logic_vector(31 downto 0);
        reset           : in     vl_logic;
        number          : out    vl_logic_vector(31 downto 0);
        carry           : out    vl_logic
    );
end Counter;
