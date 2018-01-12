library verilog;
use verilog.vl_types.all;
entity mips_registers is
    port(
        read_data_1     : out    vl_logic_vector(31 downto 0);
        read_data_2     : out    vl_logic_vector(31 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        read_reg_1      : in     vl_logic_vector(4 downto 0);
        read_reg_2      : in     vl_logic_vector(4 downto 0);
        write_reg       : in     vl_logic_vector(4 downto 0);
        signal_reg_write: in     vl_logic;
        clock           : in     vl_logic
    );
end mips_registers;
