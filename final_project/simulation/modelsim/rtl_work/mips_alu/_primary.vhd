library verilog;
use verilog.vl_types.all;
entity mips_alu is
    port(
        ALUOp           : in     vl_logic_vector(3 downto 0);
        content1        : in     vl_logic_vector(31 downto 0);
        content2        : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0);
        signal_zero     : out    vl_logic
    );
end mips_alu;
