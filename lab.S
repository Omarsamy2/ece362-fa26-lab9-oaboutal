
######################################################
# Lab 9 template file
######################################################

######################################################
# .data is where variables will reside.
# We define the following below so you know what 
# their values are.
.data
.global lowercase_string
lowercase_string:
    // Specify a string ending with '\0'
    .asciz "ece 362 is awesome!"

// Align to 4bytes boundary as we have a string above
.balign 4
######################################################


######################################################
# All code goes in the .text section
.text

.global asm_strlen
asm_strlen:
    /* uint32_t asm_strlen(char *str)
     * Take in a pointer to a string and return
     * its length up to the null terminating
     * character `\0`
    **/   

    /* Enter your code after this comment */
    beq a0, x0, strlen_zero
    li t0, 0

strlen_loop:
    lb t1, 0(a0)
    beq t1, x0, strlen_done
    addi t0, t0, 1
    addi a0, a0, 1
    jal x0, strlen_loop

strlen_done:
    add a0, t0, x0
    ret

strlen_zero:
    li a0, 0
    /* Enter your code above this comment */
    ret

.global asm_fib
asm_fib:
    /* void asm_fib(int *arr, uint32_t length)
     * Accept a pointer to an array of integer and
     * the length of the array, then generate fibonacci
     * series starting at `0` and store the result
     * back to the array `arr` at corresponding indices.
     **/

    /* Enter your code after this comment */
    beq a0, x0, fib_done
    beq a1, x0, fib_done

    li t0, 0
    li t1, 0
    li t2, 1

fib_loop:
    bgeu t0, a1, fib_done

    slli t4, t0, 2
    add t5, a0, t4

    beq t0, x0, fib_case0
    li t6, 1
    beq t0, t6, fib_case1

    add t6, t1, t2
    add t1, t2, x0
    add t2, t6, x0
    sw t2, 0(t5)
    addi t0, t0, 1
    jal x0, fib_loop

fib_case0:
    sw t1, 0(t5)
    addi t0, t0, 1
    jal x0, fib_loop

fib_case1:
    sw t2, 0(t5)
    addi t0, t0, 1
    jal x0, fib_loop

fib_done:
    /* Enter your code above this comment */
    ret

.global asm_toUppercase
asm_toUppercase:
    /* void asm_toUppercase(char *str)
     * loop through an entire string and only convert
     * the lowercase letter to uppercase, leaving the
     * rest of the string intact
     **/

    /* Enter your code after this comment */
    beq a0, x0, upper_done

upper_loop:
    lb t0, 0(a0)
    beq t0, x0, upper_done

    li t1, 97
    li t2, 123

    blt t0, t1, upper_skip
    bge t0, t2, upper_skip

    addi t0, t0, -32
    sb t0, 0(a0)

upper_skip:
    addi a0, a0, 1
    jal x0, upper_loop

upper_done:
    /* Enter your code above this comment */
    ret


######################################################
