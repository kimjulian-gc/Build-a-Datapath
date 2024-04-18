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
