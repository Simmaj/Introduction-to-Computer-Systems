
ld $z, r0                   # r0 = address of z
ld $t, r1                   # r1 = address of t
ld $y, r2                   # r2 = address of y
ld $b, r3                   # r3 = address of b

ld $4, r4                    # r4 = 4
ld (r3,r4,4), r5             # r5 = b[4]
ld (r3,r5,4), r5             # r5 = b[z]
st r5, (r0)                  # z = b[z]

st r1, (r2)                  # y = &t
ld (r2), r5                  # r2 = &t
ld $7, r4                    # r4 = 7 
st r4, (r5)                  # *y = 7

ld $2, r4                   # r4 = 2
ld (r3,r4,4),r5             # r5 = b[2]
shl $2, r5                  # r5 = r5 << 2 (index * 4=offset)
add r3, r5                  # r5 = r5 + r3 (base + offset)
st r5, (r2)                 # y = &b[b[2]]

ld $5, r4                   # r4 = 5
ld (r3,r4,4),r4             # r4 = b[5] 6
ld (r5), r6                 # r6 = value at &b[b[2]] value of *y 4
add r6, r4                  # r5 = *y + b[5]  10
st r4, (r5)                 # *y = *y + b[5] b[3]=10
halt




.pos 0x1000
z:               .long 0xffffffff         # z
.pos 0x2000
t:               .long 0xffffffff         # t
.pos 0x3000
y:               .long 0xffffffff         #y
.pos 0x4000
b:               .long 0x00000001         # b[0]
                 .long 0x00000002         # b[1]
                 .long 0x00000003          # b[2]
                 .long 0x00000004         # b[3] 
                 .long 0x00000005         # b[4] 
                 .long 0x00000006         # b[5]
                 .long 0x00000007         # b[6]
                 .long 0x00000008         # b[7]
                 .long 0x00000009         # b[8]
                 .long 0x00000000         # b[9]