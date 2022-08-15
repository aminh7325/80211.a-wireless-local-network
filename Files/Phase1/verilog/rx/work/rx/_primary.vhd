library verilog;
use verilog.vl_types.all;
entity rx is
    generic(
        \signal\        : integer := 0;
        service         : integer := 1;
        psdu            : integer := 2;
        tail_pad        : integer := 3;
        service1        : integer := 4;
        preamble        : integer := 5
    );
    port(
        data_in         : in     vl_logic;
        n_pad           : in     vl_logic_vector(5 downto 0);
        Clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_out        : out    vl_logic;
        ready           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \signal\ : constant is 1;
    attribute mti_svvh_generic_type of service : constant is 1;
    attribute mti_svvh_generic_type of psdu : constant is 1;
    attribute mti_svvh_generic_type of tail_pad : constant is 1;
    attribute mti_svvh_generic_type of service1 : constant is 1;
    attribute mti_svvh_generic_type of preamble : constant is 1;
end rx;
