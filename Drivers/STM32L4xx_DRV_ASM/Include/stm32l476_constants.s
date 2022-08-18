

// Constants defined in file stm32L476xx_constants.S
// 	 RCC   base address is 0x40021000
//   AHB2ENR register offset is 0x4C
// 	 RCC   base address is 0x40021000
//   APB2ENR register offset is 0x60
.equ	RCC_BASE, 	 	0x40021000
.equ    RCC_AHB2ENR,   	0x4C // RCC AHB2 peripheral clock reg (RM0351, page 251) Para el pueto A
.equ	RCC_APB2ENR,   	0x60 // RCC APB2 peripheral clock reg (RM0351, page 258) Para el SysTick



// 	 GPIOA base address is 0x48000000
//   MODER register offset is 0x00
//   ODR   register offset is 0x14
.equ	GPIOA_BASE, 	0x48000000 // GPIO BASE ADDRESS (RM0351, page 78)
.equ	GPIOB_BASE, 	0x48000400
.equ	GPIOC_BASE, 	0x48000800
.equ	GPIOD_BASE, 	0x48000C00
.equ	GPIOE_BASE, 	0x48001000
.equ	GPIOF_BASE, 	0x48001400
.equ	GPIOG_BASE, 	0x48001800
.equ	GPIOH_BASE, 	0x48001C00

.equ    GPIO_MODER,   	0x00 // GPIO port mode register (RM0351, page 303)
.equ 	GPIO_OTYPER, 	0x04
.equ 	GPIO_PUPDR,		0x0C
.equ 	GPIO_IDR, 		0x10
.equ    GPIO_ODR,     	0x14 // GPIO outpu data register (RM0351, page 306)

.equ 	SysTick_BASE,	0xE000E010
.equ 	SysTick_CTRL,	0x0		// SysTick Control and Status Register
.equ 	SysTick_LOAD,	0x4		// SysTick reload Value Register
.equ 	SysTick_VAL,	0x8		// SysTick Current Value Register
.equ 	SysTick_CALIB,	0xC		// SysTick Calibration Register

.equ 	SCB_BASE,		0xE000ED00
.equ 	SCB_SHP,		0x20
