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

# Encode a j instruction
@assembler.instruction('j #', 1)
def j_instr(immediate):
  return pips.iformat(opcode='j', r0='$zero', r1='$zero', imm=immediate)

# Encode a jal instruction
@assembler.instruction('jal #', 1)
def jal_instr(immediate):
  return pips.iformat(opcode='j', r0='$ra', r1='$zero', imm=immediate, link=True)

# Encode a jr instruction
@assembler.instruction('jr #', 1)
def jr_instr(dest):
  return pips.rformat(opcode='j', r0='$zero', r1='$zero', r2=dest)

# Encode a beq instruction
@assembler.instruction('beq #, #, #', 1)
def beq_instr(reg1, reg2, imm):
  return pips.iformat(opcode='beq', r0=reg1, r1=reg2, imm=imm)

# Encode a bne instruction
@assembler.instruction('bne #, #, #', 1)
def bne_instr(reg1, reg2, imm):
  return pips.iformat(opcode='bne', r0=reg1, r1=reg2, imm=imm)

# Encode a lw instruction
@assembler.instruction('lw #, #(#)', 1)
def lw_instr(reg1, imm, reg2):
  return pips.iformat(opcode='lw', r0=reg1, r1=reg2, imm=imm)

# Encode a sw instruction
@assembler.instruction('sw #, #(#)', 1)
def sw_instr(reg1, imm, reg2):
  return pips.iformat(opcode='sw', r0=reg1, r1=reg2, imm=imm)

# Encode a lb instruction
@assembler.instruction('lb #, #(#)', 1)
def lb_instr(reg1, imm, reg2):
  return pips.iformat(opcode='lb', r0=reg1, r1=reg2, imm=imm)

# Encode a sb instruction
@assembler.instruction('sb #, #(#)', 1)
def sb_instr(reg1, imm, reg2):
  return pips.iformat(opcode='sb', r0=reg1, r1=reg2, imm=imm)

# Encode a sll instruction
@assembler.instruction('sll #, #, #', 1)
def sll_instr(reg1, reg2, imm):
  return pips.rformat(
    opcode='add', r0=reg1, r1='$zero', r2=reg2,
    shift_type=pips.SHIFT_LEFT, shift_amt=imm
  )

# Encode a srl instruction
@assembler.instruction('srl #, #, #', 1)
def srl_instr(reg1, reg2, imm):
  return pips.rformat(
    opcode='add', r0=reg1, r1='$zero', r2=reg2,
    shift_type=pips.SHIFT_RIGHT_LOGICAL, shift_amt=imm
  )

# Encode a sra instruction
@assembler.instruction('sra #, #, #', 1)
def sra_instr(reg1, reg2, imm):
  return pips.rformat(
    opcode='add', r0=reg1, r1='$zero', r2=reg2,
    shift_type=pips.SHIFT_RIGHT_ARITHMETIC, shift_amt=imm
  )

@assembler.instruction('not #, #', 1)
def not_instr(reg1, reg2):
  # Notice, 
  # A  |  NOT A  |  A NOR 0
  # 0  |    1    |     1
  # 1  |    0    |     0
  # So, (NOT A) = (NOR A 0)
  return pips.rformat(opcode='nor', r0=reg1, r1=reg2, r2='$zero')

@assembler.instruction('push #', 2)
def push_instr(reg):
  return addi_instr('$sp', '$sp', '-2') + sw_instr(reg, '0', '$sp')

@assembler.instruction('pop #', 2)
def pop_instr(reg):
  return lw_instr(reg, '0', '$sp') + addi_instr('$sp', '$sp', '2')

@assembler.instruction('blt! #, #, #', 2)
# if reg_mut < reg_comp (1 ne 0), then jump.
def bltmut_instr(reg_mut, reg_comp, dest):
  # no zero register as reg_mut
  if (reg_mut == '$zero'):
      raise ValueError('The $zero register cannot be the first argument to blt!, because it is read-only.')
  return slt_instr(reg_mut, reg_mut, reg_comp) + bne_instr(reg_mut, '$zero', dest)

@assembler.instruction('ble! #, #, #', 2)
# if not reg_comp < reg_mut (0 eq 0), then reg_comp >= reg_mut.
# thus, reg_mut <= reg_comp.
def blemut_instr(reg_mut, reg_comp, dest):
  # no zero register as reg_mut
  if (reg_mut == '$zero'):
      raise ValueError('The $zero register cannot be the first argument to ble!, because it is read-only.')
  return slt_instr(reg_mut, reg_comp, reg_mut) + beq_instr(reg_mut, '$zero', dest)

@assembler.instruction('bgt! #, #, #', 2)
# if reg_comp < reg_mut (1 ne 0), then reg_mut > reg_comp.
def bgtmut_instr(reg_mut, reg_comp, dest):
  # no zero register as reg_mut
  if (reg_mut == '$zero'):
      raise ValueError('The $zero register cannot be the first argument to bgt!, because it is read-only.')
  return slt_instr(reg_mut, reg_comp, reg_mut) + bne_instr(reg_mut, '$zero', dest)

@assembler.instruction('bge! #, #, #', 2)
# if not reg_mut < reg_comp (0 eq 0), then reg_mut >= reg_comp.
def bgemut_instr(reg_mut, reg_comp, dest):
  # no zero register as reg_mut
  if (reg_mut == '$zero'):
      raise ValueError('The $zero register cannot be the first argument to bge!, because it is read-only.')
  return slt_instr(reg_mut, reg_mut, reg_comp) + beq_instr(reg_mut, '$zero', dest)