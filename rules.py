import assembler
import pips

# The instruction decorator tells the assembler to create a new syntax rule for add instructions.
# The "#" spots indicate operands, which are passed in as parameters to the function below.
# The second parameter indicates the number of instructions this rule will create (1 in this case)
@assembler.instruction('add #, #, #', 1)
def add_instr(dest, operand1, operand2):
  return pips.rformat(opcode='add', r0=dest, r1=operand1, r2=operand2)

# Encode an addi instruction
@assembler.instruction('addi #, #, #', 1)
def addi_instr(dest, op1, immediate):
  return pips.iformat(opcode='add', r0=dest, r1=op1, imm=immediate)
  
# Encode the li pseudoinstruction using an addition to zero
@assembler.instruction('li #, #', 1)
def li_instr(dest, immediate):
  return addi_instr(dest, '$zero', immediate)

# Encode a subi instruction
@assembler.instruction('subi #, #, #', 1)
def subi_instr(dest, op1, immediate):
  return pips.iformat(opcode='sub', r0=dest, r1=op1, imm=immediate)
  
# Encode a sub instruction
@assembler.instruction('sub #, #, #', 1)
def sub_instr(dest, operand1, operand2):
  return pips.rformat(opcode='sub', r0=dest, r1=operand1, r2=operand2)
  
# Encode a nop instruction -- add $zero and 0, store in 0.
@assembler.instruction('nop', 1)
def nop_instr():
  return pips.iformat(opcode='add', r0='$zero', r1='$zero', imm=0)
  
# Encode an and instruction
@assembler.instruction('and #, #, #', 1)
def and_instr(dest, operand1, operand2):
  return pips.rformat(opcode='and', r0=dest, r1=operand1, r2=operand2)
  
# Encode an andi instruction
@assembler.instruction('andi #, #, #', 1)
def andi_instr(dest, operand1, immediate):
  return pips.iformat(opcode='and', r0=dest, r1=operand1, imm=immediate)

# Encode an or instruction
@assembler.instruction('or #, #, #', 1)
def or_instr(dest, operand1, operand2):
  return pips.rformat(opcode='or', r0=dest, r1=operand1, r2=operand2)
  
# Encode an ori instruction
@assembler.instruction('ori #, #, #', 1)
def ori_instr(dest, operand1, immediate):
  return pips.iformat(opcode='or', r0=dest, r1=operand1, imm=immediate)

# Encode an nand instruction
@assembler.instruction('nand #, #, #', 1)
def nand_instr(dest, operand1, operand2):
  return pips.rformat(opcode='nand', r0=dest, r1=operand1, r2=operand2)
  
# Encode an nandi instruction
@assembler.instruction('nandi #, #, #', 1)
def nandi_instr(dest, operand1, immediate):
  return pips.iformat(opcode='nand', r0=dest, r1=operand1, imm=immediate)

# Encode an nor instruction
@assembler.instruction('nor #, #, #', 1)
def nor_instr(dest, operand1, operand2):
  return pips.rformat(opcode='nor', r0=dest, r1=operand1, r2=operand2)
  
# Encode an nori instruction
@assembler.instruction('nori #, #, #', 1)
def nori_instr(dest, operand1, immediate):
  return pips.iformat(opcode='nor', r0=dest, r1=operand1, imm=immediate)

# Encode an xor instruction
@assembler.instruction('xor #, #, #', 1)
def xor_instr(dest, operand1, operand2):
  return pips.rformat(opcode='xor', r0=dest, r1=operand1, r2=operand2)
  
# Encode an xori instruction
@assembler.instruction('xori #, #, #', 1)
def xori_instr(dest, operand1, immediate):
  return pips.iformat(opcode='xor', r0=dest, r1=operand1, imm=immediate)

# Encode an slt instruction
@assembler.instruction('slt #, #, #', 1)
def slt_instr(dest, operand1, operand2):
  return pips.rformat(opcode='slt', r0=dest, r1=operand1, r2=operand2)
  
# Encode an slti instruction
@assembler.instruction('slti #, #, #', 1)
def slti_instr(dest, operand1, immediate):
  return pips.iformat(opcode='slt', r0=dest, r1=operand1, imm=immediate)

# Encode an sltu instruction
@assembler.instruction('sltu #, #, #', 1)
def sltu_instr(dest, operand1, operand2):
  return pips.rformat(opcode='sltu', r0=dest, r1=operand1, r2=operand2)
  
# Encode an sltui instruction
@assembler.instruction('sltiu #, #, #', 1)
def sltui_instr(dest, operand1, immediate):
  return pips.iformat(opcode='sltu', r0=dest, r1=operand1, imm=immediate)