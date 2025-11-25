.pos 0x100

                ld $a, r0           #
                ld $g, r1           #
                ld $e, r2           # 
                ld $y, r3           #
                ld (r1), r1         #load the value of g
                ld (r0,r1,4), r4    #a[g] 
                inc r1              #g+1 
                ld (r0,r1,4), r5    #a[g] 
                add r5, r4          # r4= a[g]+a[g+1] 
                st r4, (r3)         #y = a[g] + a[g + 1]
                ld $0xf, r1         #lod 0xf in r1
                ld (r3), r3         #load the value of y in r3
                and r3, r1          #y & 0xf 
                st r1, (r2)         # e = y & 0xf
                halt

.pos 0x1000
g:               .long 0xffffffff         # c
.pos 0x2000
e:               .long 0xffffffff         # y
.pos 0x3000
y:               .long 0xffffffff         # y
.pos 0x4000
a:               .long 0xffffffff         # a[0]
                 .long 0xffffffff         # a[1]
                 .long 0xffffffff         # a[2]
                 .long 0xffffffff         # a[3] 
                 .long 0xffffffff         # a[4] 
                 .long 0xffffffff         # a[5]
                 .long 0xffffffff         # a[6]
                 .long 0xffffffff         # a[7]
                 .long 0xffffffff         # a[8]
                 .long 0xffffffff         # a[9]