library verilog;
use verilog.vl_types.all;
entity Buzzer_vlg_check_tst is
    port(
        SPK             : in     vl_logic;
        done            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Buzzer_vlg_check_tst;
