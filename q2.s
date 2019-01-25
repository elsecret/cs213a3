.pos 0x100

    # tmp = 0
    ld $0x0, r0         # r0 = 0
    ld $tmp, r1         # r1 = address of tmp
    st r0, 0(r1)        # tmp = 0

    # tos = 0
    ld $tos, r2         # r2 =  address of tos
    st r0, 0(r2)        # tos = 0

    # s[tos] = a[0]
    ld $s, r3           # r3 = address of s
    ld $a, r4           # r4 = address of a
    ld 0(r4), r5        # r5 = a[0]
    ld 0(r2), r6        # r6 = tos
    st r5, (r3, r6, 4)  # s[tos] = a[0]
    
    # tos++
    inc r6              # r6++
    st r6, 0(r2)        # tos = r6

    # s[tos] = a[1]
    ld $0x1, r7         # r7 = 1
    ld (r4, r7, 4), r0  # r0 = a[1]
    st r0, (r3, r6, 4)  # s[tos] = a[1]

    # tos++
    inc r6              # r6++
    st r6, 0(r2)        # tos = r6

    # s[tos] = a[2]
    ld $0x2, r7         # r7 = 2
    ld (r4, r7, 4), r0  # r0 = a[2]
    st r0, (r3, r6, 4)  # s[tos] = a[2]

    # tos++
    inc r6              # r6++
    st r6, 0(r2)        # tos = r6

    # tos--
    dec r6              # r6--
    st r6, 0(r2)        # tos = r6

    # tmp = s[tos]
    st r0, 0(r1)

    # tos--
    dec r6              # r6--
    st r6, 0(r2)        # tos = r6

    # tmp = tmp + s[tos]
    ld $tmp, r0         # r0 = address of tmp
    ld 0(r0), r1        # r1 = tmp
    ld $tos, r2         # r2 = address of tos
    ld 0(r2), r3        # r3 = tos
    ld $s, r4           # r4 = address of s
    ld (r4, r3, 4), r5  # r5 = s[tos]
    add r5, r1          # r1 = tmp + s[tos]
    st r1, 0(r0)        # tmp = r1

    # tos--
    dec r3              # r3--
    st r3, 0(r2)        # tos = r3

    # tmp = tmp + s[tos]
    ld $tmp, r0         # r0 = address of tmp
    ld 0(r0), r1        # r1 = tmp
    ld $tos, r2         # r2 = address of tos
    ld 0(r2), r3        # r3 = tos
    ld $s, r4           # r4 = address of s
    ld (r4, r3, 4), r5  # r5 = s[tos]
    add r5, r1          # r1 = tmp + s[tos]
    st r1, 0(r0)        # tmp = r1

    halt

.pos 0x200
# Data area

tos:.long 0             # tos
tmp:.long 0             # tmp
a:  .long 0             # a[0]
    .long 0             # a[1]
    .long 0             # a[2]
s:  .long 0             # s[0]
    .long 0             # s[1]
    .long 0             # s[2]
    .long 0             # s[3]
    .long 0             # s[4]