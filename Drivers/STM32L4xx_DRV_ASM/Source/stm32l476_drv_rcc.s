
.syntax unified
.include "stm32l476_constants.s"


.global DRV_RCC_APB2ENR_Init
.global DRV_RCC_AHB2ENR_Init


.section .text.DRV_RCC_AHB2ENR_Init
.type	DRV_RCC_AHB2ENR_Init,%function
DRV_RCC_AHB2ENR_Init:

// Enable GPIOA Peripheral Clock (bit 0 in AHB2ENR register) (RM0351, page 251)
	ldr r2, [r0,#RCC_AHB2ENR]   // Read its content to r5
	orr r2, r1
	str r2, [r0,#RCC_AHB2ENR]
	bx lr
.size	DRV_RCC_AHB2ENR_Init, .-DRV_RCC_AHB2ENR_Init

.section .text.DRV_RCC_APB2ENR_Init
.type	DRV_RCC_APB2ENR_Init,%function
DRV_RCC_APB2ENR_Init:
// Enable SYSCFG Controller Clock (bit 0 in APB2ENR register)
	ldr r2, [r0,RCC_APB2ENR]                // Read its content to r5
	orr r2, r1                 // Set   bit 0 to enable SYSCFG clock
	str r2, [r0,RCC_APB2ENR]                // Store result in peripheral clock register
	bx lr
.size	DRV_RCC_APB2ENR_Init, .-DRV_RCC_APB2ENR_Init
