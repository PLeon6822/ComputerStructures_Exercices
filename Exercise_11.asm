.data
  A: .word 9
  B: .word 7
.text
  .globl main
main:
  lw $a0 A
  lw $a1 B
  add $a2 $a0 $a1 #A+B
  sub $a3 $a0 $a1 #A-B
  jal f
  move $a0 $v0
  li $v0 1
  syscall
f:
  add $t0 $a0 $a1
  add $t1 $a2 $a3 #z+w=c+d
  beq $t0 $t1 equal
equal:
  move $v0 $t0
end:
  jr $ra
