library verilog;
use verilog.vl_types.all;
entity mips_data_mem is
    port(
        clock           : in     vl_logic;
        read_data       : out    vl_logic_vector(31 downto 0);
        mem_address     : in     vl_logic_vector(31 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        sig_mem_read    : in     vl_logic;
        sig_mem_write   : in     vl_logic
    );
end mips_data_mem;
