.pos 0x100

    # a = 3
    ld $a, r0       # r0 = address of a
    ld $0x3, r1     # r1 = 3
    st r1, 0(r0)    # a = r1

    # p = &a
    ld $p, r2       # r2 = address of p
    st r0, (r2)     # p = address of a

    # *p = *p - 1
    dec r1          # r1--
    st r1, 0(r0)    # a = r1 (therefore *p = *p - 1)

    # p = &b[0]
    ld $b, r3       # r3 = address of b
    st r3, 0(r2)    # p = r3

    # p++
    inca r3         # r3 += 4
    st r3, 0(r2)    # p = r3

    # p[a] = b[a]
    ld $a, r0       # r0 = address of a
    ld 0(r0), r1    # r1 = value of a
    ld $b, r2       # r2 = address of b
    ld (r2, r1, 4), r3  # r3 = b[a]
    ld $p, r4       # r4 = address of p
    ld (r4), r5     # r5 = value of p (which is an address)
    st r3, (r5, r1, 4)  # p[a] = r3

    # *(p+3) = b[0]
    ld $0x3, r6     # r6 = 3
    ld 0(r2), r7    # r7 = b[0]
    st r7, (r5, r6, 4)  # p[3] = r7

    halt


.pos 0x1000
    # Data area

a:.long 0             # a
p:.long 0             # p
b:.long 0             # b[0]
  .long 0             # b[1]
  .long 0             # b[2]
  .long 0             # b[3]
  .long 0             # b[4]
