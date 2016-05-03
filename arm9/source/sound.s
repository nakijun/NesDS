@---------------------------------------------------------------------------------
	#include "equates.h"
@---------------------------------------------------------------------------------
	.global updatesound
	.global soundwrite
	.global _4015r
pcmirqbakup = mapperdata+24
pcmirqcount = mapperdata+28
@---------------------------------------------------------------------------------
.section .text,"ax"
@---------------------------------------------------------------------------------
@Sound_reset moved to junk.c
@---------------------------------------------------------------------------------
	@mov r0,#0x00001000
	@str r0,pcmctrl
@	bx lr
@---------------------------------------------------------------------------------
soundwrite:
@---------------------------------------------------------------------------------
	stmfd sp!,{r3,lr}

	@IMPORT writeAPU
	mov r1,addy
	bl writeAPU
	
	ldmfd sp!,{r3,pc}
@---------------------------------------------------------------------------------
_4015r:
@---------------------------------------------------------------------------------
	ldr r1, =IPC_REG4015		@which is updated by s_apu.c
	ldrb r0, [r1]
	mov pc, lr
@---------------------------------------------------------------------------------
updatesound: @called from line 0..  r0-r9 are free to use
@---------------------------------------------------------------------------------
	bx lr
@---------------------------------------------------------------------------------
