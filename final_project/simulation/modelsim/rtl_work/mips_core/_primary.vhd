library verilog;
use verilog.vl_types.all;
entity mips_core is
    port(
        clock           : in     vl_logic;
        instruction     : out    vl_logic_vector(31 downto 0);
        ALUResult       : out    vl_logic_vector(31 downto 0);
        read_data_1     : out    vl_logic_vector(31 downto 0);
        read_data_2     : out    vl_logic_vector(31 downto 0);
        write_reg       : out    vl_logic_vector(4 downto 0);
        RegWrite        : out    vl_logic
    );
end mips_core;
