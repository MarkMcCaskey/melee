.include "macros.inc"

.section .text  # 0x80005940 - 0x803B7240 

.global ftNess_SpecialAirNHold_Coll
ftNess_SpecialAirNHold_Coll:
/* 80117A98 00114678  7C 08 02 A6 */	mflr r0
/* 80117A9C 0011467C  90 01 00 04 */	stw r0, 4(r1)
/* 80117AA0 00114680  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80117AA4 00114684  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80117AA8 00114688  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80117AAC 0011468C  7C 7E 1B 78 */	mr r30, r3
/* 80117AB0 00114690  83 E3 00 2C */	lwz r31, 0x2c(r3)
/* 80117AB4 00114694  4B F6 A2 59 */	bl func_80081D0C
/* 80117AB8 00114698  2C 03 00 00 */	cmpwi r3, 0
/* 80117ABC 0011469C  41 82 00 30 */	beq lbl_80117AEC
/* 80117AC0 001146A0  7F E3 FB 78 */	mr r3, r31
/* 80117AC4 001146A4  4B F6 5D 39 */	bl func_8007D7FC
/* 80117AC8 001146A8  3C 80 0C 4C */	lis r4, 0x0C4C5080@ha
/* 80117ACC 001146AC  C0 3F 08 94 */	lfs f1, 0x894(r31)
/* 80117AD0 001146B0  C0 42 9D 48 */	lfs f2, lbl_804D9728/*1.0f*/@sda21(r2)
/* 80117AD4 001146B4  7F C3 F3 78 */	mr r3, r30
/* 80117AD8 001146B8  C0 62 9D 40 */	lfs f3, lbl_804D9720/*0.0f*/@sda21(r2)
/* 80117ADC 001146BC  38 A4 50 80 */	addi r5, r4, 0x0C4C5080@l
/* 80117AE0 001146C0  38 80 01 5D */	li r4, 0x15d
/* 80117AE4 001146C4  38 C0 00 00 */	li r6, 0
/* 80117AE8 001146C8  4B F5 18 C5 */	bl Fighter_ActionStateChange_800693AC
lbl_80117AEC:
/* 80117AEC 001146CC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80117AF0 001146D0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80117AF4 001146D4  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80117AF8 001146D8  38 21 00 18 */	addi r1, r1, 0x18
/* 80117AFC 001146DC  7C 08 03 A6 */	mtlr r0
/* 80117B00 001146E0  4E 80 00 20 */	blr 
.global ftNess_SpecialAirNEnd_Coll
ftNess_SpecialAirNEnd_Coll:
/* 80117B04 001146E4  7C 08 02 A6 */	mflr r0
/* 80117B08 001146E8  90 01 00 04 */	stw r0, 4(r1)
/* 80117B0C 001146EC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80117B10 001146F0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80117B14 001146F4  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80117B18 001146F8  7C 7E 1B 78 */	mr r30, r3
/* 80117B1C 001146FC  83 E3 00 2C */	lwz r31, 0x2c(r3)
/* 80117B20 00114700  4B F6 A1 ED */	bl func_80081D0C
/* 80117B24 00114704  2C 03 00 00 */	cmpwi r3, 0
/* 80117B28 00114708  41 82 00 30 */	beq lbl_80117B58
/* 80117B2C 0011470C  7F E3 FB 78 */	mr r3, r31
/* 80117B30 00114710  4B F6 5C CD */	bl func_8007D7FC
/* 80117B34 00114714  3C 80 0C 4C */	lis r4, 0x0C4C5080@ha
/* 80117B38 00114718  C0 3F 08 94 */	lfs f1, 0x894(r31)
/* 80117B3C 0011471C  C0 42 9D 48 */	lfs f2, lbl_804D9728/*1.0f*/@sda21(r2)
/* 80117B40 00114720  7F C3 F3 78 */	mr r3, r30
/* 80117B44 00114724  C0 62 9D 40 */	lfs f3, lbl_804D9720/*0.0f*/@sda21(r2)
# SPLIT NO EARLIER THAN HERE
/* 80117B48 00114728  38 A4 50 80 */	addi r5, r4, 0x0C4C5080@l
/* 80117B4C 0011472C  38 80 01 5F */	li r4, 0x15f
/* 80117B50 00114730  38 C0 00 00 */	li r6, 0
/* 80117B54 00114734  4B F5 18 59 */	bl Fighter_ActionStateChange_800693AC
lbl_80117B58:
/* 80117B58 00114738  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80117B5C 0011473C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80117B60 00114740  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80117B64 00114744  38 21 00 18 */	addi r1, r1, 0x18
/* 80117B68 00114748  7C 08 03 A6 */	mtlr r0
/* 80117B6C 0011474C  4E 80 00 20 */	blr 

.section .sdata2
    .balign 8
.global lbl_804D9720/*0.0f*/
lbl_804D9720/*0.0f*/:
	.4byte 0x00000000
.global lbl_804D9724/*3.0f*/
lbl_804D9724/*3.0f*/:
	.4byte 0x40400000
.global lbl_804D9728/*1.0f*/
lbl_804D9728/*1.0f*/:
	.4byte 0x3F800000
	.4byte 0x00000000
