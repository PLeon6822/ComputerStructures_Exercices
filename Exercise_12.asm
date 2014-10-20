.data
.text
.globl main
main:
  li $a0 10
  jal fibonacci
  move $a0 $v0
  li $v0 1
  syscall
  li $v0 10
  syscall
fibonacci:
  subu $sp $sp 20 #a given value in bytes
  sw $a0 ($sp)
  sw $s0 4($sp)
  sw $s1 8($sp)
  sw $s2 12($sp)
  sw $ra 16($sp)
  li $s0 2
  li $s1 1 #stored values
  bge $a0 $s0 getw0
  bge $ao $s1 gone
  li $v0 0
  b end
getw0:
  subu $a0 $a0 1
  jal fibonacci
  move $s2 $v0 #$s2 ==> tmp1
  subu $a0 $a0 1
  jal fibonacci
  add $v0 $v0 $s2
  b end
gone:
  li $v0 1
end:
  lw $a0 ($sp)
  lw $s0 4($sp)
  lw $s1 8($sp)
  lw $s2 12($sp)
  lw $ra 16($sp)
  addu $sp $sp 20
  jr $ra
