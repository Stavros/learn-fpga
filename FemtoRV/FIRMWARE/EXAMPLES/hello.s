# Testing the serial interface. Echoes typed characters,
# and displays 4 LSBs using the LEDs.

.section .text
.globl _start
.align 4,0
.include "LIB/femtorv32.inc"

# Needs both NRV_IO_UART_RX and NRV_IO_UART_TX to be
# enabled. 
#
# To access it, use:
#   miniterm.py --dtr=0 /dev/ttyUSB1 115200
#   or screen /dev/ttyUSB1 115200 (<ctrl> a \ to exit)


_start:
        li t0, 15
	sw t0, IO_LEDS(gp)
        call get_char
	la a0, hello
	call print_string
	j _start

hello:
.asciz "Hello, world !!\n"