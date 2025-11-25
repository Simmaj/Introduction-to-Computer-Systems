
ld $a, r0                   # r0 = address of a
ld $p, r1                   # r1 = address of p
ld $b, r2                   # r2 = address of b
ld $3, r3                   # r3 = 3
st r3, (r0)                 # r0<-m[r0] a = 3
st r0, (r1)                 # r0<-m[r0]
dec r3                      # r3= r3 - 1
ld (r1), r4                 # r4<-m[r1]         r4 = value of p = a[0] = *p
st r3, (r4)                 # m[r4]<-r3         *p = *p - 1
st r2, (r1)                 # r1<-m[r2]         p = &b[0]
ld (r1), r4                 # r4<-m[r1]         load the value of p
inca r4                     # r4 = r4 + 4       p++ 
st r4, (r1)                 # m[r1]<-r4
ld (r2,r3,4), r5            # r5<-m[r2+r3*4]    r5 = b[a]
st r5, (r4,r3,4)            # m[r2+r3*4]<-r5    p[a] = b[a]
ld $0, r3                   # r3 = 0
ld (r2,r3,4), r4            # r4<-m[r2+r3*4]    r4 = b[0] 
ld $3, r3                   # r3 = 0
ld (r1), r1                 # r1<-m[r1]         load the value of p
st r4, (r1,r3,4)            # m[r1+r3*4]<-r4    *(p+3) = b[0] 
halt


.pos 0x1000
a:               .long 0xffffffff         # a
.pos 0x2000
p:               .long 0xffffffff         # p
.pos 0x3000
b:               .long 0x00000001         # b[0]
                 .long 0x00000002         # b[1]
                 .long 0x00000003         # b[2]
                 .long 0x00000004         # b[3] 
                 .long 0x00000005         # b[4] 