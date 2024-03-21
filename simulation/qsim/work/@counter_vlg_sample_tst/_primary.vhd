library verilog;
use verilog.vl_types.all;
entity Counter_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        duration        : in     vl_logic_vector(31 downto 0);
        reset           : in     vl_logic;
        sup             : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end Counter_vlg_sample_tst;
