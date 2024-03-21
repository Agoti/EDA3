library verilog;
use verilog.vl_types.all;
entity Buzzer is
    port(
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        done            : out    vl_logic;
        SPK             : out    vl_logic
    );
end Buzzer;
