.pos 0x100

    # i = a[3]
    ld $a, r0           # r0 = address of a
    ld $i, r1           # r1 = address of i
    ld $0x3, r2         # r2 = 3
    ld (r0, r2, 4), r3  # r3 = a[r2] = a[3]
    st r3, 0(r1)        # i = r3 = a[3]

    # i = a[i]
    ld (r0, r3, 4), r4  # r4 = a[i]
    st r4, 0(r1)        # i = r4 = a[i]
    
    # p = &j
    ld $p, r5           # r5 = address of p
    ld $j, r6           # r6 = address of j
    st r6, 0(r5)        # p = r6 = &j

    # *p = 4
    ld $0x4, r2         # r2 = 4
    st r2, 0(r6)        # *p (= j) = r2 (= 4)

    # p = &a[a[2]]
    ld $0x2, r7         # r7 = 2
    ld (r0, r7, 4), r1  # r1 = a[2]
    shl $0x2, r1        # r1 << 2 (to calculate offset)
    add r0, r1          # r1 = r0 + r1
                        # i.e. r1 = address of a + offset = &a[a[2]]
    st r1, 0(r5)        # p = r1 = &a[a[2]]

    # *p = *p + a[4]
    ld 0(r1), r3        # r3 = *p = a[a[2]]
    ld (r0, r2, 4), r4  # r4 = a[4]
    add r4, r3          # r3 = r3 + r4 (= *p + a[4])
    st r3, 0(r1)        # *p = r3

    halt

.pos 0x200
# Data area

i:  .long 0             # i
j:  .long 0             # j
p:  .long 0             # p
a:  .long 0             # a[0]
    .long 0             # a[1]
    .long 0             # a[2]
    .long 0             # a[3]
    .long 0             # a[4]
    .long 0             # a[5]
    .long 0             # a[6]
    .long 0             # a[7]
    .long 0             # a[8]
    .long 0             # a[9]