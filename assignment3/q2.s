
ld $a, r0                   # r0 = address of a
ld $s, r1                   # r1 = address of s
ld $tos, r2                 # r2 = address of tos
ld $tmp, r3                 # r3 = address of tmp
ld $0, r4                   # r4 = 0
st r4, (r2)                 # r2<-m[r4]                         
st r4, (r3)                 # r3<-m[r4]                         
ld (r0,r4,4), r5            # r5 <-m[r0+r4*4] r5=a[0]
st r5,(r1,r4,4)             # m[r1+r4*4]<-r5 s[tos] = a[0]      s[0]=a[0]=1
inc r4                      # r4<-r4 + 1  
st r4, (r2)                 # m[r2]<-r4 tos++                   
ld (r0,r4,4), r5            # r5 <-m[r0+r4*4] r5=a[1]
st r5,(r1,r4,4)             # m[r1+r4*4]<-r5 s[tos] = a[1]      s[1]=a[1]=2
inc r4                      # r4<-r4 + 1 
st r4, (r2)                 # m[r2]<-r4 tos++                   
ld (r0,r4,4), r5            # r5 <-m[r0+r4*4] r5=a[2]
st r5,(r1,r4,4)             # m[r1+r4*4]<-r5 s[tos] = a[2]      s[2]=a[2]=3
inc r4                      # r4<-r4 + 1 
st r4, (r2)                 # m[r2]<-r4 tos++                   
dec r4                      # r4<-r4 - 1 
st r4, (r2)                 # m[r2]<-r4 tos--                  
ld(r1,r4,4),r5              # r5 <-m[r0+r4*4] r5=s[tos]
st r5, (r3)                 # m[r3]<-r3                         
dec r4                      # r4<-r4 - 1 
st r4, (r2)                 # m[r2]<-r4 tos--                  
ld(r1,r4,4),r5              # r5<-m[r0+r4*4] r5=s[tos]
ld (r3), r6                 # r6<-m[r3]  r6 = value of tmp
add r6, r5                  # r5 = r5 + r6   tmp + s[tos]     
st r5, (r3)                 # m[r3]<-r5                          
dec r4                      # r4<-r4 - 1 
st r4, (r2)                 # m[r2]<-r4 tos--                  
ld(r1,r4,4),r5              # r5<-m[r0+r4*4] r5=s[tos]
ld (r3), r6                 # r6<-m[r3]  r6 = value of tmp
add r6, r5                  # r5 = r5 + r6   tmp + s[tos]     
st r5, (r3)                 # m[r3]<-r5                          
halt


.pos 0x1000
tos:               .long 0xffffffff         # tos
.pos 0x2000
tmp:               .long 0xffffffff         # tmp
.pos 0x3000
a:                 .long 0x00000001        # a[0]
                   .long 0x00000002        # a[1]
                   .long 0x00000003        # a[2]
.pos 0x4000
s:               .long 0xffffffff         # s[0]
                 .long 0xffffffff         # s[1]
                 .long 0xffffffff         # s[2]
                 .long 0xffffffff         # s[3] 
                 .long 0xffffffff         # s[4] 