library verilog;
use verilog.vl_types.all;
entity Counter_vlg_check_tst is
    port(
        carry           : in     vl_logic;
        number          : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Counter_vlg_check_tst;
