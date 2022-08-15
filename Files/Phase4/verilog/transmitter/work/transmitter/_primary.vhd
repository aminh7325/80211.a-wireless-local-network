library verilog;
use verilog.vl_types.all;
entity transmitter is
    generic(
        frame_size      : integer := 180;
        signal_preamble : integer := 0;
        service         : integer := 1;
        psdu            : integer := 2;
        tail_pad        : integer := 3
    );
    port(
        data_in         : in     vl_logic;
        n_pad           : in     vl_logic_vector(5 downto 0);
        Clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_out        : out    vl_logic_vector;
        ready           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of frame_size : constant is 1;
    attribute mti_svvh_generic_type of signal_preamble : constant is 1;
    attribute mti_svvh_generic_type of service : constant is 1;
    attribute mti_svvh_generic_type of psdu : constant is 1;
    attribute mti_svvh_generic_type of tail_pad : constant is 1;
end transmitter;
