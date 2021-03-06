INCLUDE "includes.asm"


SECTION "Misc Crystal", ROMX, BANK[MISC_CRYSTAL]

MobileAdapterGFX:
INCBIN "gfx/misc/mobile_adapter.2bpp"


Function17a68f:: ; 17a68f (5e:668f)
	call Function17a6a8
	call Function17a751
	ld hl, $d088
	bit 5, [hl]
	jr z, .asm_17a6a6
	ld de, StringBuffer1 ; $d073
	push de
	call Function17a721
	pop de
	xor a
	ret
.asm_17a6a6
	scf
	ret

Function17a6a8: ; 17a6a8 (5e:66a8)
	push de
	push bc
	ld hl, StringBuffer2 ; $d086
	ld bc, $a
	xor a
	call ByteFill
	ld hl, Buffer1 ; $d1ea (aliases: MagikarpLength)
	ld bc, $10
	ld a, $ff
	call ByteFill
	pop bc
	ld a, c
	and a
	jr z, .asm_17a6c9
	ld hl, $d088
	set 4, [hl]
.asm_17a6c9
	pop de
	call Function17a6f5
	call Function17aba0
	callba Function106464
	call Function17ac0c
	callba Function104000
	call Function17abcf
	callba Function49409
	callba Function49420
	call Function32f9
	call DelayFrame
	ret

Function17a6f5: ; 17a6f5 (5e:66f5)
	ld hl, Buffer1 ; $d1ea (aliases: MagikarpLength)
	ld c, $0
	ld b, $8
.asm_17a6fc
	ld a, [de]
	call Function17a713
	jr c, .asm_17a70e
	ld a, [de]
	swap a
	call Function17a713
	jr c, .asm_17a70e
	inc de
	dec b
	jr nz, .asm_17a6fc
.asm_17a70e
	ld a, c
	ld [$d08c], a
	ret

Function17a713: ; 17a713 (5e:6713)
	and $f
	cp $a
	jr nc, .asm_17a71d
	ld [hli], a
	inc c
	and a
	ret
.asm_17a71d
	ld [hl], $ff
	scf
	ret

Function17a721: ; 17a721 (5e:6721)
	push de
	ld h, d
	ld l, e
	ld bc, $8
	ld a, $ff
	call ByteFill
	pop de
	ld hl, Buffer1 ; $d1ea (aliases: MagikarpLength)
	ld b, $8
.asm_17a732
	ld c, $0
	ld a, [hli]
	cp $a
	jr nc, .asm_17a748
	ld c, a
	ld a, [hli]
	cp $a
	jr nc, .asm_17a74c
	swap a
	or c
	ld [de], a
	inc de
	dec b
	jr nz, .asm_17a732
	ret
.asm_17a748
	ld a, $ff
	ld [de], a
	ret
.asm_17a74c
	ld a, $f0
	or c
	ld [de], a
	ret

Function17a751: ; 17a751 (5e:6751)
	xor a
	ld [$d087], a
.asm_17a755
	call Function17a781
	call Function17a7ae
	call Function17a97b
	call Function17a770
	call Function17a78f
	ld hl, $d08f
	inc [hl]
	ld a, [$d087]
	bit 7, a
	jr z, .asm_17a755
	ret

Function17a770: ; 17a770 (5e:6770)
	ld a, [hOAMUpdate] ; $ff00+$d8
	push af
	ld a, $1
	ld [hOAMUpdate], a ; $ff00+$d8
	call HideSprites
	call Function17a9cb
	pop af
	ld [hOAMUpdate], a ; $ff00+$d8
	ret

Function17a781: ; 17a781 (5e:6781)
	ld a, [$FF00+$aa]
	push af
	ld a, $1
	ld [$FF00+$aa], a
	call Functiona57
	pop af
	ld [$FF00+$aa], a
	ret

Function17a78f: ; 17a78f (5e:678f)
	ld hl, $d088
	bit 7, [hl]
	res 7, [hl]
	jr nz, .asm_17a79f
	callba Function10402d
	ret
.asm_17a79f
	callba Function104061
	ret
; 17a7a6 (5e:67a6)

INCBIN "baserom.gbc",$17a7a6,$17a7ae - $17a7a6

Function17a7ae: ; 17a7ae (5e:67ae)
	ld a, [$d087]
	ld hl, $67b6
	rst $28
	ret

Jumptable_17a7b6: ; 17a7b6 (5e:67b6)
	dw Function17a7c2
	dw Function17a7cd
	dw Function17a7d8
	dw Function17a7ff
	dw Function17a81a
	dw Function17a7f4


Function17a7c2: ; 17a7c2 (5e:67c2)
	ld a, $4
	call Function17aad3
	ld a, $1
	ld [$d087], a
	ret

Function17a7cd: ; 17a7cd (5e:67cd)
	call Function17a83c
	call Function17a8ae
	ret c
	call Function17a848
	ret

Function17a7d8: ; 17a7d8 (5e:67d8)
	call Function17a83c
	call Function17a848
	ld hl, $d08b
	dec [hl]
	ret nz
	call Function17ac1d
	call Function17ac2a
	ld hl, $d088
	set 7, [hl]
	ld a, $1
	ld [$d087], a
	ret

Function17a7f4: ; 17a7f4 (5e:67f4)
	ld hl, $d08b
	dec [hl]
	ret nz
	ld hl, $d087
	set 7, [hl]
	ret

Function17a7ff: ; 17a7ff (5e:67ff)
	ld hl, $d08b
	dec [hl]
	ret nz
	call Function17ac1d
	call Function17ac2a
	ld hl, $d088
	set 7, [hl]
	ld hl, $d088
	set 5, [hl]
	ld hl, $d087
	set 7, [hl]
	ret

Function17a81a: ; 17a81a (5e:681a)
	call IsSFXPlaying
	ret nc
	ld a, [hJoyPressed] ; $ff00+$a7
	and $3
	ret z
	call Function1c07
	call Function17ac1d
	call Function17ac2a
	ld hl, $d088
	set 7, [hl]
	ld hl, $d088
	res 6, [hl]
	ld a, $1
	ld [$d087], a
	ret

Function17a83c: ; 17a83c (5e:683c)
	ld a, [$FF00+$a9]
	and $f0
	ld c, a
	ld a, [hJoyPressed] ; $ff00+$a7
	and $b
	or c
	ld c, a
	ret

Function17a848: ; 17a848 (5e:6848)
	ld a, c
	and $60
	cp $60
	jr z, .asm_17a876
	ld a, c
	and $50
	cp $50
	jr z, .asm_17a87d
	ld a, c
	and $a0
	cp $a0
	jr z, .asm_17a884
	ld a, c
	and $90
	cp $90
	jr z, .asm_17a88b
	bit 6, c
	jr nz, .asm_17a892
	bit 7, c
	jr nz, .asm_17a899
	bit 5, c
	jr nz, .asm_17a8a0
	bit 4, c
	jr nz, .asm_17a8a7
	xor a
	ret
.asm_17a876
	ld a, $9
	call Function17aad0
	scf
	ret
.asm_17a87d
	ld a, $a
	call Function17aad0
	scf
	ret
.asm_17a884
	ld a, $b
	call Function17aad0
	scf
	ret
.asm_17a88b
	ld a, $c
	call Function17aad0
	scf
	ret
.asm_17a892
	ld a, $5
	call Function17aad0
	scf
	ret
.asm_17a899
	ld a, $6
	call Function17aad0
	scf
	ret
.asm_17a8a0
	ld a, $7
	call Function17aad0
	scf
	ret
.asm_17a8a7
	ld a, $8
	call Function17aad0
	scf
	ret

Function17a8ae: ; 17a8ae (5e:68ae)
	bit 1, c
	jr nz, .asm_17a8bc
	bit 0, c
	jr nz, .asm_17a8cc
	bit 3, c
	jr nz, .asm_17a8d7
	xor a
	ret
.asm_17a8bc
	ld a, $b
	ld [$d08a], a
	call Function17aa98
	call Function17a943
	call Function17aa88
	scf
	ret
.asm_17a8cc
	call Function17aad7
	call Function17aa98
	call Function17a8de
	scf
	ret
.asm_17a8d7
	ld a, $c
	call Function17aad3
	scf
	ret

Function17a8de: ; 17a8de (5e:68de)
	ld a, $2
	call Function17aae0
	ld a, [hl]
	cp $f1
	jr z, .asm_17a8fd
	cp $f0
	jr z, .asm_17a904
	cp $f2
	jr z, .asm_17a911
	ld e, a
	call Function17a964
	ld a, $2
	ld [$d087], a
	call Function17aa88
	ret
.asm_17a8fd
	call Function17a943
	call Function17aa88
	ret
.asm_17a904
	call Function17aad7
	call Function17aa98
	call Function17a91e
	call Function17aa88
	ret
.asm_17a911
	call Function17aa98
	ld a, $5
	ld [$d087], a
	xor a
	call Function17aa88
	ret

Function17a91e: ; 17a91e (5e:691e)
	ld a, [$d08c]
	cp $7
	jr c, .asm_17a92c
	ld a, $3
	ld [$d087], a
	xor a
	ret
.asm_17a92c
	call Function1d6e
	call Function17a99e
	ld hl, $d088
	set 7, [hl]
	ld hl, $d088
	set 6, [hl]
	ld a, $4
	ld [$d087], a
	scf
	ret

Function17a943: ; 17a943 (5e:6943)
	ld a, [$d08c]
	and a
	jr z, .asm_17a95d
	dec a
	ld [$d08c], a
	ld c, a
	ld b, $0
	ld hl, Buffer1 ; $d1ea (aliases: MagikarpLength)
	add hl, bc
	ld [hl], $ff
	ld a, $2
	ld [$d087], a
	and a
	ret
.asm_17a95d
	ld a, $5
	ld [$d087], a
	xor a
	ret

Function17a964: ; 17a964 (5e:6964)
	ld a, [$d08c]
	cp $10
	jr nc, .asm_17a979
	ld c, a
	ld b, $0
	inc a
	ld [$d08c], a
	ld hl, Buffer1 ; $d1ea (aliases: MagikarpLength)
	add hl, bc
	ld [hl], e
	and a
	ret
.asm_17a979
	scf
	ret

Function17a97b: ; 17a97b (5e:697b)
	hlcoord 1, 1
	ld bc, $212
	call ClearBox
	hlcoord 3, 2
	ld de, Buffer1 ; $d1ea (aliases: MagikarpLength)
	ld a, [$d08c]
	and a
	ret z
	ld c, a
.asm_17a990
	ld a, [de]
	inc de
	cp $a
	jr nc, .asm_17a99d
	add $f6
	ld [hli], a
	dec c
	jr nz, .asm_17a990
	ret
.asm_17a99d
	ret

Function17a99e: ; 17a99e (5e:699e)
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Function17ac46
	hlcoord 2, 14
	ld de, $69b2
	call PlaceString
	ret
; 17a9b2 (5e:69b2)

INCBIN "baserom.gbc",$17a9b2,$17a9cb - $17a9b2

Function17a9cb: ; 17a9cb (5e:69cb)
	ld de, Sprites ; $c400
	ld hl, $d088
	bit 6, [hl]
	jr nz, .asm_17a9df
	call Function17a9e3
	call Function17aa22
	call Function17a9f5
	ret
.asm_17a9df
	call Function17a9e3
	ret

Function17a9e3: ; 17a9e3 (5e:69e3)
	ld a, $3
	ld [$d08e], a
	ld hl, $6a77
	ld b, $8
	ld c, $8
	ld a, $5
	call Function17aa4a
	ret

Function17a9f5: ; 17a9f5 (5e:69f5)
	ld a, [$d08c]
	cp $10
	ret nc
	ld a, [$d08f]
	swap a
	and $1
	add $1
	ld [$d08e], a
	ld a, [$d08c]
	cp $10
	jr c, .asm_17aa0f
	dec a
.asm_17aa0f
	ld c, $8
	call SimpleMultiply
	add $18
	ld b, a
	ld c, $11
	ld hl, $6a72
	ld a, $4
	call Function17aa4a
	ret

Function17aa22: ; 17aa22 (5e:6a22)
	ld a, $0
	ld [$d08e], a
	push de
	ld a, $3
	call Function17aae0
	add a
	add a
	add a
	add $0
	push af
	ld a, $4
	call Function17aae0
	add a
	add a
	add a
	add $8
	ld c, a
	pop af
	ld b, a
	pop de
	ld a, $0
	ld hl, $6a77
	call Function17aa4a
	ret

Function17aa4a: ; 17aa4a (5e:6a4a)
	ld [$d08d], a
	ld a, b
	add $8
	ld b, a
	ld a, c
	add $10
	ld c, a
	ld a, [hli]
.asm_17aa56
	push af
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [$d08d]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [$d08e]
	or [hl]
	inc hl
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .asm_17aa56
	ret
; 17aa72 (5e:6a72)

INCBIN "baserom.gbc",$17aa72,$17aa88 - $17aa72

Function17aa88: ; 17aa88 (5e:6a88)
	jr c, asm_17aa91
	ld de, $20
	call PlaySFX
	ret

asm_17aa91: ; 17aa91 (5e:6a91)
	ld de, $19
	call PlaySFX
	ret

Function17aa98: ; 17aa98 (5e:6a98)
	ld a, $5
	ld [$d08b], a
	call Function17aaa9
	call Function17aac3
	ld hl, $d088
	set 7, [hl]
	ret

Function17aaa9: ; 17aaa9 (5e:6aa9)
	ld a, $3
	call Function17aae3
	ld c, a
	ld b, $0
	ld hl, AttrMap ; $cdd9
	add hl, bc
	push hl
	ld a, $4
	call Function17aae3
	ld bc, $14
	pop hl
	call AddNTimes
	ret

Function17aac3: ; 17aac3 (5e:6ac3)
	ld a, $b
	push hl
	ld [hli], a
	ld [hli], a
	pop hl
	ld de, $14
	add hl, de
	ld [hli], a
	ld [hli], a
	ret

Function17aad0: ; 17aad0 (5e:6ad0)
	call Function17aae0

Function17aad3: ; 17aad3 (5e:6ad3)
	ld [$d089], a
	ret

Function17aad7: ; 17aad7 (5e:6ad7)
	push af
	ld a, [$d089]
	ld [$d08a], a
	pop af
	ret

Function17aae0: ; 17aae0 (5e:6ae0)
	call Function17aad7

Function17aae3: ; 17aae3 (5e:6ae3)
	push af
	ld a, [$d08a]
	ld bc, $d
	ld hl, $6af7
	call AddNTimes
	pop af
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ret
; 17aaf7 (5e:6af7)

INCBIN "baserom.gbc",$17aaf7,$17aba0 - $17aaf7

Function17aba0: ; 17aba0 (5e:6ba0)
	ld a, [rVBK] ; $ff00+$4f
	push af
	ld a, $1
	ld [rVBK], a ; $ff00+$4f
	ld hl, $9000
	ld de, $6fa5
	ld bc, $5e80
	call Get2bpp
	pop af
	ld [rVBK], a ; $ff00+$4f
	ld hl, $8000
	ld de, $7465
	ld bc, $5e05
	call Get2bpp
	ld hl, $8050
	ld de, $601a
	ld bc, $4504
	call Get2bpp
	ret

Function17abcf: ; 17abcf (5e:6bcf)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	ld hl, $6c55
	ld de, Unkn1Pals ; $d000
	ld bc, $30
	call CopyBytes
	ld hl, $6c95
	ld de, MartPointer ; $d040 (aliases: Unkn2Pals)
	ld bc, $40
	call CopyBytes
	ld hl, $74b5
	ld de, $d048
	ld bc, $10
	call CopyBytes
	ld hl, $7471
	ld de, $d058
	ld bc, $8
	ld a, $2
	call FarCopyBytes
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

Function17ac0c: ; 17ac0c (5e:6c0c)
	call Function17ac1d
	call Function17ac2a
	ld hl, TileMap ; $c4a0 (aliases: SpritesEnd)
	ld b, $2
	ld c, $12
	call Function17ac46
	ret

Function17ac1d: ; 17ac1d (5e:6c1d)
	ld hl, $6cd5
	decoord 0, 4
	ld bc, $118
	call CopyBytes
	ret

Function17ac2a: ; 17ac2a (5e:6c2a)
	ld hl, $6e3d
	ld de, $ce29
	ld bc, $118
	call CopyBytes
	ld hl, $ce29
	ld bc, $118
.asm_17ac3c
	ld a, [hl]
	or $8
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_17ac3c
	ret

Function17ac46: ; 17ac46 (5e:6c46)
	ld a, [$d088]
	bit 4, a
	jr nz, .asm_17ac51
	call TextBox
	ret
.asm_17ac51
	call Function3eea
	ret
; 17ac55 (5e:6c55)

INCBIN "baserom.gbc",$17ac55,$17b629 - $17ac55


