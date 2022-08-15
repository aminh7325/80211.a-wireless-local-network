library verilog;
use verilog.vl_types.all;
entity interleaver is
    generic(
        N_CBPS          : integer := 48;
        N_BPSC          : integer := 1;
        length          : integer := 96
    );
    port(
        in_data         : in     vl_logic_vector(1 downto 0);
        out_data        : out    vl_logic_vector;
        Clk             : in     vl_logic;
        ready           : out    vl_logic;
        en              : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N_CBPS : constant is 1;
    attribute mti_svvh_generic_type of N_BPSC : constant is 1;
    attribute mti_svvh_generic_type of length : constant is 1;
end interleaver;
