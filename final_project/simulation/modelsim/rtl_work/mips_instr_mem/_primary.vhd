library verilog;
use verilog.vl_types.all;
entity mips_instr_mem is
    port(
        clock           : in     vl_logic;
        instruction     : out    vl_logic_vector(31 downto 0);
        program_counter : in     vl_logic_vector(31 downto 0)
    );
end mips_instr_mem;
