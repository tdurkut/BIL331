# t0 --> integer part of first num
# t1 --> fractional part of first num
# t2 --> integer part of second num
# t3 --> fractional part of second num
# t4 --> operator
# s0 --> '+' 
# s1 --> '-'
# s2 --> '*'
.data
msg_intro:     		
	.asciiz "Welcome!\n"
msg_num1_int_part:
     	.asciiz "\nPlease give integer part of first number: "
msg_num1_frac_part:      
	.asciiz "\nPlease give fractional part of first number: "
msg_num2_int_part:      
	.asciiz "\nPlease give integer part of second number: "
msg_num2_frac_part:      
	.asciiz "\nPlease give fractional part of second number: "
msg_operator:
	.asciiz "\nPlease give an operator (+, -, *):"
result:
	.asciiz "\nResult:"
seperator:
	.asciiz "."
digit_counter:
	.word 0
extender_counter:
	.word 0
	
        .text
        .globl main
main:   li $v0, 4               # syscall 4, print string
        la $a0, msg_intro       # give argument string
        syscall                 # print string
	
    	addi $sp,$sp,-20	# 5 word
	                
        li $v0, 4 		# syscall 4, print string
        la $a0, msg_num1_int_part # give argument string
        syscall 		# print string
        
        li $v0, 5		# syscall 5, read integer part of first number
        syscall 		# read integer will be stored in $v0
        
     	sw $v0,0($sp)		# sp with offset 0, put integer part of first number
     	lw $t0, 0($sp)
     	
	li $v0, 4 		# syscall 4, print string
        la $a0, msg_num1_frac_part # give argument string
        syscall 		# print string
        
        li $v0, 5		# syscall 5, read integer part of first number
        syscall 		# read integer will be stored in $v0

    	sw $v0,4($sp)		# sp with offset 4, put fractional part of first number
     	lw $t1, 4($sp)
     	
     	li $v0, 4 		# syscall 4, print string
        la $a0, msg_num2_int_part # give argument string
        syscall 		# print string
        
        li $v0, 5		# syscall 5, read integer part of first number
        syscall 		# read integer will be stored in $v0
        
	sw $v0, 8($sp)		# sp with offset 8, put integer part of second number
     	lw $t2, 8($sp)

     	li $v0, 4 		# syscall 4, print string
        la $a0, msg_num2_frac_part # give argument string
        syscall 		# print string
        
        li $v0, 5		# syscall 5, read integer part of first number
        syscall 		# read integer will be stored in $v0
        
	sw $v0, 12($sp)		# sp with offset 12, put integer part of second number
     	lw $t3, 12($sp)
    	
    	li $v0, 4 		# syscall 4, print string
        la $a0, msg_operator	# give argument string
        syscall 		# print string
    	
	li $v0, 8		# syscall 8, read operator
        la $a0, 16($sp)         # give $a0 the address to hold the operator
        li $a1, 4 		# a word
        syscall
        
        lb $t4, 16($sp) 	
        
	li $s0, '+'             # plus
        li $s1, '-'             # minus
        li $s2, '*'             # multiply
	
	beq $t4, $s0, do_plus
	#beq $t4, $s1, do_minus
	#beq $t4, $s2, do_multiply
	# else
	#j err

do_plus:
	add $t0, $t0, $t2  	# add integer parts, put first num's integer part
	move $a0, $t1 		# put frac part of first num to a0
	jal find_digit_count
	move $s3, $v0		# put digit count of frac part of 1st num to s3
	move $a0, $t3		# put frac part of 2nd num to a0
	jal find_digit_count
	move $s4, $v0		# put digit count of frac part of 2nd num to s4
	beq $s3, $s4, normal_addition # if digit counts are equal then just do addition
	blt $s3, $s4, extend_num1 # num1 * 10^(b-a) 2<3  a = 2, b = 3 for num1: 3.44 (a=2)  num2: 3.222 (b=3)
	bgt $s3, $s4, extend_num2 # num2 * 10^(a-b) 3>1  a = 3, b = 1 
	j exit
normal_addition:
	add $t1, $t1, $t3	# add fract parts, put first num's fract part
	move $a0, $t3 		# put frac part of first num to a0
	jal find_digit_count
	move $s7, $v0		# put digit count of frac part of 1st num to s3
	j print
extend_num1: #t1
	sub $s5, $s4, $s3 	# b-a
	move $a0, $s5		# give argument difference of digits
	move $a1, $t1 		# give argument digit count of fract part of num1 
	jal extender
	move $t1, $v0		# put new num1 to t1
	move $a0, $t1 		# put frac part of first num to a0
	jal find_digit_count
	move $s7, $v0		# put digit count of frac part of 1st num to s7
	add $t1, $t1, $t3
	j print
	
extend_num2: #t3
	sub $s5, $s3, $s4	# a-b
	move $a0, $s5		# give argument difference of digits
	move $a1, $t3		# give argument digit count of fract part of num2
	jal extender		# jump and link to extender
	move $t3, $v0		# put new num2 to t3
	move $a0, $t3 		# put frac part of second num to a0
	jal find_digit_count
	move $s7, $v0		# put digit count of frac part of 1st num to s7
	add $t1, $t1, $t3
	j print
	# PRINTING RESULT
print:
	move $a0, $s7		# give argument digit count of new fract
	add $a1, $zero,1 	# give argument 1 
	jal extender
	move $s7, $v0		# put new num to s7
	
	div $t1,$s7
	mfhi $t1		# remainder
	mflo $t2		# quotient
	add $t0, $t0, $t2	# add carry
	
	li $v0, 4	# system call print string
	la $a0, result	# put result to a0
	syscall
	
	li $v0, 1	# system call print int
	move $a0, $t0	# print int part
	syscall
	
	li $v0, 4 	# system call print string
	la $a0, seperator # print seperator (.)
	syscall
	
	
	
	li $v0, 1	#system call print int
	move $a0, $t1	# print fract part
	syscall
	
	j exit
	
extender:	# extends a0 times $a1 extending num
	bne $a0,1,ext_iter
	add  $t7, $zero, 10	# 10 stored in t7
	mult $a1, $t7
	mflo $v0
	jr $ra

ext_iter:
	la $s6, extender_counter # get counter address to s6
	lw $s7, ($s6)		 # put s7, s6's content (counter)
ext_iter_inner:
	mult $a1, $t7		# multiply by 10
	addi $s7, $s7, 1	# counter++
	mflo $s6
	move $a1, $s6
	bne $s7, $a0, ext_iter_inner 
	# if ends
	mflo $v0	
	jr $ra
	
	
		
	
        

	     	
     	
exit:   addi $sp, $sp, 20	# close stack 	       
   	li $v0, 10              # exit code
        syscall                 # exit 

        
find_digit_count:
	lw $t5, digit_counter 	# digit counter in t5
	move $t6, $a0 		# number whose digit count will be calculated in t6
iter:	addi $t5, $t5, 1	# counter++
	div $t6, $t6, 10	# num/10 , quotient will be stored in t6
	bnez $t6, iter
	# else (it means quotient = 0 so, digit count is 1)
	move $v0, $t5 		# return counter
	jr $ra
		

