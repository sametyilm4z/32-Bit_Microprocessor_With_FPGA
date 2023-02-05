library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MIPS is
    port(
    clk : in std_logic;
    Reset: in std_logic;
    Mips_out: out std_logic_vector(31 downto 0)
    );
end MIPS;

architecture Behavioral of MIPS is

component ALU32Bit is
  Port ( 	
-- INPUTS:
	A: in std_logic_vector (31 downto 0); --32-Bit input port A.
	B: in std_logic_vector (31 downto 0); --32-Bit input port B.
	ALUControl: in std_logic_vector (3 downto 0); --4-Bit input control bits to select an ALU operation.
-- OUTPUTS:
	ALUResult: out std_logic_vector (31 downto 0);  --32-Bit ALU result output.
	ZERO: out std_logic --1-Bit output flag. 
);
end component;

component Controller is
PORT (
Op: in STD_LOGIC_VECTOR(5 DOWNTO 0);--The opcode from the current instruction
Funct: in STD_LOGIC_VECTOR(5 DOWNTO 0);
--which select specific data paths depending on the instruction
MemRead: out std_logic;
MemtoReg: out STD_LOGIC;
MemWrite: out STD_LOGIC;
ALUControl: out STD_LOGIC_VECTOR(3 DOWNTO 0);
ALUSrc: out STD_LOGIC;
RegDst: out STD_LOGIC;
RegWrite: out STD_LOGIC;
PCSrc: out std_logic
);
end component;

component dataMemory is
  port(
    clk  : in std_logic;
    memWrite  : in std_logic;
    memRead   : in std_logic;
    address       : in std_logic_vector(31 downto 0);
    writeData     : in std_logic_vector(31 downto 0);
    readData      : out std_logic_vector(31 downto 0)
  );
end component;

component instructionmemory is
---------//ports//--------------------------------------
PORT (address: in STD_LOGIC_VECTOR(31 DOWNTO 0);
 	   instruction: out STD_LOGIC_VECTOR(31 DOWNTO 0));
-----------------------------------------------
end component;

component ProgramCounter is 
PORT(
Address: IN STD_LOGIC_VECTOR(31 downto 0); -- input
Reset : IN STD_LOGIC; -- async. clear.
Clk : IN STD_LOGIC; -- clock.
PCResult: OUT STD_LOGIC_VECTOR(31 downto 0) -- output.
);
end component;

component RegisterFile is 
port(
    ReadRegister1: in std_logic_vector(4 downto 0);
    ReadRegister2: in std_logic_vector(4 downto 0);
    WriteRegister: in std_logic_vector(4 downto 0);
    WriteData: in std_logic_vector(31 downto 0);
    RegWrite: in std_logic;
    clk: in std_logic;
    
    ReadData1: out std_logic_vector(31 downto 0):=x"00000000";
    ReadData2: out std_logic_vector(31 downto 0):=x"00000000"
);
end component;

component SignExtension is

PORT (
A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
SignImm: out STD_LOGIC_VECTOR(31 DOWNTO 0)
);

end component;

component PCAdder is
port(
    PCResult: in std_logic_vector (31 downto 0);
    PCAddResult: out std_logic_vector(31 downto 0)
);
end component;

component Mux is
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux5bit is
    Port ( SS : in STD_LOGIC;
           AA : in STD_LOGIC_VECTOR (4 downto 0);
           BB : in STD_LOGIC_VECTOR (4 downto 0);
           YY : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component Adder is
    port(
         X, M : in std_logic_vector(31 downto 0);
         SUM : out std_logic_vector(31 downto 0)
    );
end component;

component seven_MUX is
    Port ( S : in std_logic_vector(3 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           A: in std_logic_vector (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0):= x"00000000"
           );
end component;

component shiftleft2 is
	port (
		entry: in std_logic_vector(31 downto 0);
		exitt: out std_logic_vector(31 downto 0)
	);
end component;
------------------//signals//----------------------------------
-- signal a,b,c,d,e: std_logic; buraya signal yazcaz
signal rd_m4, alu_addm4, m4_wd, rd2_wdm2, rd1_aluA, m2_aluB, se_m4sl2, sl2_adder, adder_m3, m3_pc, pcadd_adderm3, pc_pcaddim: std_logic_vector(31 downto 0);
signal im_conreg,alugiris: std_logic_vector(31 downto 0);
signal m1_reg: std_logic_vector(4 downto 0);
signal con_mr, con_mtr, con_mw, con_rd, con_alusrc, con_rw, con_pcsrc, ZERO_led: std_logic;
signal  con_alu: std_logic_vector(3 downto 0);
begin
ALU: ALU32Bit port map(
    A => alugiris,
	B => m2_aluB,
	ALUControl => con_alu,
	ALUResult => alu_addm4,
	ZERO => ZERO_led
);

Cont: Controller port map(
Op => im_conreg(31 downto 26),
Funct => im_conreg(5 downto 0),
MemRead => con_mr,
MemtoReg => con_mtr,
MemWrite => con_mw,
ALUControl => con_alu,
ALUSrc => con_alusrc,
RegDst => con_rd,
RegWrite => con_rw,
PCSrc => con_pcsrc
);

Data: dataMemory port map(
    clk => clk,
    memWrite => con_mw,
    memRead => con_mr, 
    address =>  alu_addm4,    
    writeData =>  rd2_wdm2,   
    readData => rd_m4    
);

Inst: instructionmemory port map(
    address => pc_pcaddim,
 	instruction => im_conreg
);

PC: ProgramCounter port map(
    Address => m3_pc,
    Reset => Reset,
    Clk => clk,
    PCResult => pc_pcaddim
);

RegF: RegisterFile port map(
    ReadRegister1 => im_conreg(25 downto 21),
    ReadRegister2 => im_conreg(20 downto 16),
    WriteRegister => m1_reg,
    WriteData => m4_wd,
    RegWrite => con_rw,
    clk => clk,
    ReadData1 => rd1_aluA,
    ReadData2 => rd2_wdm2
);

SigE: SignExtension port map(
    A => im_conreg(15 downto 0),
    SignImm => se_m4sl2
);

PCA: PCAdder port map(
    PCResult => pc_pcaddim,
    PCAddResult => pcadd_adderm3
);

Mux5: seven_MUX port map(
    S => con_alu,
    A => rd1_aluA,
    B => rd2_wdm2,
    Y => alugiris


);

Mux2: Mux port map(
    S => con_alusrc,
    A => se_m4sl2,
    B => rd2_wdm2,
    Y => m2_aluB
);

Mux3: Mux port map(
    S => con_pcsrc,
    A => adder_m3,
    B => pcadd_adderm3,
    Y => m3_pc
);

Mux4: Mux port map(
    S => con_mtr,
    A => rd_m4,
    B => alu_addm4,
    Y => m4_wd
);
Mips_out <= m4_wd;
 AdALU: Adder port map(
         X => pcadd_adderm3,
         M => sl2_adder,
         SUM => adder_m3
    );

SL2: shiftleft2 port map(
        entry => se_m4sl2,
		exitt => sl2_adder
);


end Behavioral;
