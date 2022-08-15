library verilog;
use verilog.vl_types.all;
entity encoder is
    port(
        data_in         : in     vl_logic;
        data_out        : out    vl_logic_vector(1 downto 0);
        Clk             : in     vl_logic;
        reset           : in     vl_logic;
        rate            : in     vl_logic;
        en              : in     vl_logic
    );
end encoder;
