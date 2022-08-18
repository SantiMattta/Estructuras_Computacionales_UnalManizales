.syntax unified

.include "stm32l476_constants.s"
.global DRV_SysTick_Config
.global DRV_GetTick
.global SysTick_Handler
.global DRV_Delay

.data
uwTick: 	.word 		0

.section .text.DRV_SysTick_Config
.type	DRV_SysTick_Config,%function
DRV_SysTick_Config:
	push {lr}
// SysTick configuration PM0214 Sec. 4.5 SysTick timer (STK) pg. 246
	ldr r0,=RCC_BASE
	movw r1,0x1
	movt r1,0 	// RCC_APB2ENR, SYSCFGEN, RM0351 Pg. 259
	bl DRV_RCC_APB2ENR_Init

// Set SysTick_CTRL to disabLe SysTick IRQ and SysTick timer
	ldr r0, =SysTick_BASE

	// DisabLe SysTick IRQ and SysTick counter, select external clock
	//mov r1, #0
	str r1, [r0, #SysTick_CTRL]

	// Specify the number of cLock cycles between two interrupts
	ldr r2, =3999 // Change it based on interrupt interval
	str r2, [r0, #SysTick_LOAD] // Save to SysTick reload register

	// Clear SysTick current value register (SysTick_VAL)
	mov r1, #0
	str r1, [r0, #SysTick_VAL] // Write e to SysTick value register

	// Set interrupt priority for SysTick
	ldr r2, =SCB_BASE
	add r2, r2,#SCB_SHP
	ldr r1, =0xf0000000	// Set priority as 1, see Figure 11-7
	str r1, [r2]	// SCB->SHP[ll), see Figure 11 -8

	// Set SysTick_CTRL to enable SysTick timer and SysTick interrupt
	LDR r1, [r0, #SysTick_CTRL]
	MOV r2,#0X00000007
	ORR r1,r1,r2  // Enable SysTick counter & interrupt
	STR r1, [r0, #SysTick_CTRL]

	// Must enable global interrupts before super-loop.
	CPSIE i
	pop {pc}
	//bx lr
.size	DRV_SysTick_Config, .-DRV_SysTick_Config

.section	.text.SysTick_Handler
.type	SysTick_Handler,%function
SysTick_Handler:
	push {lr}
	ldr r0,=uwTick
	ldr r1,[r0]
	add r1,#1
	str r1,[r0]
	pop {pc}
	//bx lr
.size SysTick_Handler, .-SysTick_Handler

.section	.text.DRV_GetTick
.type	DRV_GetTick,%function
DRV_GetTick:
	ldr r1,=uwTick
	ldr r1,[r1]
	str r1,[r0]
	bx lr
.size DRV_GetTick, .-DRV_GetTick


.section	.text.DRV_Delay
.type	DRV_Delay,%function
DRV_Delay:
// delay1:
delay1:
	sub r0,#1
	cbz r0,enddelay1
	b delay1
enddelay1:
	bx lr
.size DRV_Delay, .-DRV_Delay

