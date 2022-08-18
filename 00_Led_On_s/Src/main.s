/*
 * main.s
 *
 *  Created on: Apr 2, 2022
 *      Author: gosorio
 */


.syntax unified

.global main

// Constants defined in file stm32L476xx_constants.S
// 	 RCC   base address is 0x40021000
//   AHB2ENR register offset is 0x4C
// 	 RCC   base address is 0x40021000
//   APB2ENR register offset is 0x60
.equ	RCC_BASE, 	 	0x40021000
.equ    RCC_AHB2ENR,   	0x4C // RCC AHB2 peripheral clock reg (RM0351, page 251)



// 	 GPIOA base address is 0x48000000
//   MODER register offset is 0x00
//   ODR   register offset is 0x14
.equ	GPIOA_BASE, 	0x48000000 // GPIO BASE ADDRESS (RM0351, page 78)

.equ    GPIO_MODER,   	0x00 // GPIO port mode register (RM0351, page 303)
.equ    GPIO_ODR,     	0x14 // GPIO outpu data register (RM0351, page 306)

.section .text.main
.type	main,%function
main:

// Enable GPIOA Peripheral Clock (bit 0 in AHB2ENR register) (RM0351, page 251)
	ldr r6, =RCC_BASE       // Load peripheral clock reg address to r6
	ldr r5, [r6,#RCC_AHB2ENR]   // Read its content to r5
	orr r5, 0x00000001	// AHB2 peripheral clock enable register (RCC_AHB2ENR) (RM0351, PAGE 251
	str r5, [r6,#RCC_AHB2ENR]

// Make GPIOA Pin5 as output pin (bits 1:0 in MODER register)
	ldr r6, =GPIOA_BASE       // Load GPIOA base register address to r6
	ldr r5, [r6,#GPIO_MODER]    // Read the content the MODER register to r5
	orr r5, #(1<<10)          	// Clear bits 11, 10 for P5 (RM0351, page 303)
	bfc r5, #11, #1          	// Write 01 to bits 11, 10 for P5 (RM0351, page 303)
	str r5, [r6,#GPIO_MODER]	// Store result in GPIOA MODER register


//Set pin A5
	ldr r6, =GPIOA_BASE       // Load GPIOA MODER register address to r6
	ldr r5, [r6,#GPIO_ODR]    // Read ODR content to r5
	orr r5, #(1<<5)          	// Set P5 (RM0351, page 306)
	str r5, [r6,#GPIO_ODR]	// Store result in GPIOA MODER register



loop:
	 nop
	 nop
	 nop
	b loop
.size	main, .-main
