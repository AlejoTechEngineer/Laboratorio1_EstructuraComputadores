.data
msg1: .asciiz "Ingrese la cantidad de numeros a comparar (3 a 5): "
msg2: .asciiz "Ingrese un numero: "
msg3: .asciiz "El numero menor es: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0
    move $t1, $zero

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t2, $v0
    addi $t1, $t1, 1

loop:
    beq $t1, $t0, done

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    bge $t3, $t2, skip
    move $t2, $t3

skip:
    addi $t1, $t1, 1
    j loop

done:
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
