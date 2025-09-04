.data
msg1: .asciiz "Ingrese la cantidad de numeros de la serie Fibonacci: "
msg2: .asciiz "La serie es: "
msg3: .asciiz "\nLa suma de la serie es: "
space: .asciiz " "

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
    move $t2, $zero
    li $t3, 1
    move $t4, $zero

    li $v0, 4
    la $a0, msg2
    syscall

fib_loop:
    beq $t1, $t0, fib_done

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, space
    syscall

    add $t4, $t4, $t2
    add $t5, $t2, $t3
    move $t2, $t3
    move $t3, $t5
    addi $t1, $t1, 1
    j fib_loop

fib_done:
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall
