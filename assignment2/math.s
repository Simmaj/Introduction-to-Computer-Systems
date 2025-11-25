#int c, y;

#void math() {
#   c = ((((y + 1) + 4) << 1) & y) / 4;
#}

.pos 0x100
                ld $c, r0   #load address of c into r0
                ld $y, r1   #load address of y into r1
                ld (r1),r2  #laod the value of y into r2 for later use 10
                ld (r1),r1 #load the value of y into r1  if y=10
                inc r1      #y+1 11
                inca r1     #(y+1)+4 15
                shl $1, r1  #(((y + 1) + 4) << 1) 30
                and r2, r1  #((((y + 1) + 4) << 1) & y) 10
                shr $2, r1  #((((y + 1) + 4) << 1) & y) / 4  2
                st  r1, (r0)   #c = ((((y + 1) + 4) << 1) & y) / 4;
                halt




.pos 0x1000
c:               .long 0xffffffff         # c
.pos 0x2000
y:               .long 0xffffffff         # y