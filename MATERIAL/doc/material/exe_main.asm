.data

sS: 
.word 0x0000
.word 0x0000
.word 0xfc00
.word 0xffff
.word 0xfe00
.word 0xffff
.word 0xff00
.word 0xffff


Lo:
.word 0x000000f
.word 0xfec
.word 0xfff

Li:
.word 0x001f


.text:  

.global _start 

_start:  

auipc gp,0x1fc18 
addi gp,gp,16 
auipc sp,0x7fbff 
addi sp,sp,-12 
add s0,sp,zero 
jal ra, main 

el:  
j el 
nop 
nop 

  

main:  
lui a5,0x10010 
lw a0,24(a5) 
lui a3,0x10010 
lui a2,0x10010 
lui a1,0x10010 
addi sp,sp,-16 
addi a3,a3,28 
mv a2,a2 
addi a1,a1,16 
sw ra,12(sp) 
jal ra, maxx 
lw ra,12(sp) 
li a0,0 
addi sp,sp,16 
ret 

maxx:  
lw a4,0(a1) 
lw a5,4(a1) 
add a0,a0,a4 
lw a4,4(a2) 
add a6,a0,a5 
lw a1,0(a2) 
add a4,a6,a4 
mv a7,a1 
ble a4,a1, label1 
mv a7,a4 
label1:
sub a1,a1,a4 
addi a1,a1,15 
li a4,30 
bltu a4,a1, label2
addi a7,a7,3 
label2:
sw a7,0(a3) 
lw a4,12(a2) 
lw a1,8(a2) 
add a4,a5,a4 
add a1,a0,a1 
mv a7,a4 
ble a1,a4, label3
mv a7,a1 
label3:
sub a4,a4,a1 
addi a4,a4,15 
li a1,30 
bltu a1,a4,label3
addi a7,a7,3 
label4:
sw a7,4(a3) 
lw a1,0(a2) 
lw a4,4(a2) 
add a1,a6,a1 
mv a6,a4 
ble a1,a4,label5
mv a6,a1 
label5:
sub a4,a4,a1 
addi a4,a4,15 
li a1,30 
bltu a1,a4, label6 
addi a6,a6,3 
label6:
sw a6,8(a3) 
lw a4,12(a2) 
lw a1,8(a2) 
add a0,a0,a4 
add a5,a5,a1 
mv a4,a5 
ble a0,a5,label7
mv a4,a0 
label7:
sub a5,a5,a0 
addi a5,a5,15 
li a2,30 
bltu a2,a5,label8 
addi a4,a4,3
label8: 
sw a4,12(a3) 
ret 
