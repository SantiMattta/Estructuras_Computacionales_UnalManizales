.syntax unified

.include "stm32l476_constants.s"

.global DRV_GPIOx_MODER_Init
.global DRV_GPIOx_PUPDR_Init
.global DRV_GPIOx_OTYPER_Init
.global DRV_GPIOx_Set
.global DRV_GPIOx_Clear
.global DRV_GPIOx_Toggle

.section .text.DRV_GPIOx_MODER_Init
.type DRV_GPIOx_MODER_Init,%function
DRV_GPIOx_MODER_Init:

	ldr r3, [r0,#GPIO_MODER]    // Read the content the MODER register to r5
	orr r3, r1
	eor r2,0xffffffff
	and r3, r2

	str r3, [r0,#GPIO_MODER]	// Store result in GPIOA MODER register

	bx lr

.size DRV_GPIOx_MODER_Init,.-DRV_GPIOx_MODER_Init


.section .text.DRV_GPIOx_OTYPER_Init
.type DRV_GPIOx_OTYPER_Init,%function
DRV_GPIOx_OTYPER_Init:

	ldr r3, [r0,#GPIO_OTYPER]    // Read the content the MODER register to r5
	orr r3, r1
	eor r2,0xffffffff
	and r3, r2

	str r3, [r0,#GPIO_OTYPER]	// Store result in GPIOA MODER register

	bx lr

.size DRV_GPIOx_OTYPER_Init,.-DRV_GPIOx_OTYPER_Init


.section .text.DRV_GPIOx_PUPDR_Init
.type DRV_GPIOx_PUPDR_Init,%function
DRV_GPIOx_PUPDR_Init:

	ldr r3, [r0,#GPIO_PUPDR]    // Read the content the MODER register to r5
	orr r3, r1
	eor r2,0xffffffff
	and r3, r2

	str r3, [r0,#GPIO_PUPDR]	// Store result in GPIOA MODER register

	bx lr

.size DRV_GPIOx_PUPDR_Init,.-DRV_GPIOx_PUPDR_Init


.section .text.DRV_GPIOx_Set
.type	DRV_GPIOx_Set,%function
DRV_GPIOx_Set:
//Set pin A5
	ldr r2, [r0,#GPIO_ODR]    // Read ODR content to r5
	orr r2, r1          	// Set P5 (RM0351, page 306)
	str r2, [r0,#GPIO_ODR]	// Store result in GPIOA MODER register
	bx lr
.size	DRV_GPIOx_Set, .-DRV_GPIOx_Set

.section .text.DRV_GPIOx_Clear
.type	DRV_GPIOx_Clear,%function
DRV_GPIOx_Clear:
// Clear pin A5

	ldr r2, [r0,#GPIO_ODR]    // Read ODR content to r5
	eor r1, 0xffffffff          	// Clear PA5
	and r2,r1
	str r2, [r0,#GPIO_ODR]	// Store result in GPIOA MODER register
	bx lr
.size	DRV_GPIOx_Clear, .-DRV_GPIOx_Clear


.section .text.DRV_GPIOx_Toggle
.type	DRV_GPIOx_Toggle,%function
DRV_GPIOx_Toggle:
// Led tooggle
	ldr r2, [r0,#GPIO_ODR]    // Read ODR content to r5
	eor r2, r1          	// Set P5
	str r2, [r0,#GPIO_ODR]	// Store result in GPIOA MODER register
	bx lr
.size	DRV_GPIOx_Toggle, .-DRV_GPIOx_Toggle



