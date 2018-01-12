library verilog;
use verilog.vl_types.all;
entity mips_control_unit is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemtoReg        : out    vl_logic;
        ALUOp           : out    vl_logic_vector(3 downto 0);
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic
    );
end mips_control_unit;
