library verilog;
use verilog.vl_types.all;
entity Buzzer_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Buzzer_vlg_sample_tst;
