
#int first;
#int array[9];

#void swap() {
#    first = array[7];
#    array[7] = array[4];
#    array[4] = first;
#}

.pos 0x100
                ld $first, r0            #load address of first into r0
                ld $array, r1            #load address of array into r1   
                ld 28(r1), r2            #load the value of array[7] in r2
                st r2,(r0)
                ld (r0),r0               #store the array[7] into first
                ld 16(r1), r3            #load the value of array[4] in r3
                st r3, 28(r1)            #store the value of array[4] into array[7]
                st r0, 16(r1)                #store the first into array[4]
                halt
 
.pos 0x1000
first:               .long 0xffffffff         # first
.pos 0x2000
array:               .long 0xffffffff         # array[0]
                 .long 0xffffffff         # array[1]
                 .long 0xffffffff         # array[2]
                 .long 0xffffffff         # array[3]
                 .long 0xffffffff         # array[4]
                 .long 0xffffffff         # array[5]
                 .long 0xffffffff         # array[6]
                 .long 0xffffffff         # array[7]
                 .long 0xffffffff         # array[8]
                 .long 0xffffffff         # array[9]