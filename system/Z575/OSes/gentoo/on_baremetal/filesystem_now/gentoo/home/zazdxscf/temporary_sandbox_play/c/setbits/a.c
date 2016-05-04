//this is to test how SetBits works! and if it does work to set bit 31!
//I need to set bit 31 for my AMD CPU erratum:
//665 Integer Divide Instruction May Cause Unpredictable Behavior
//but I'm not testing the MSR setting in this .c program
//XXX: nevermind this, I'll be using stuff from arch/x86/kernel/cpu/amd.c ie. msr_set_bit(0xc0011029, 31); - NEVERMIND* again, that doesn't specify which CPU core to set the MSR on! I need to use wrmsr_safe_on_cpu from arch/x86/lib/msr-smp.c ; * unless... that is called within the context of setting each core... via that struct setup by cpu_dev_register func.
#include <stdio.h>
#include <inttypes.h>
#include <assert.h>

#if ! defined DEBUG || defined NDEBUG
  #warning "set DEBUG, and do not set NDEBUG"
#endif


//src: http://www.strudel.org.uk/itoa/
	/**
	 * C++ version 0.4 char* style "itoa":
	 * Written by Lukás Chmela
	 * Released under GPLv3.

	 */
	char* itoa(int value, char* result, int base) {
		// check that the base if valid
		if (base < 2 || base > 36) { *result = '\0'; return result; }

		char* ptr = result, *ptr1 = result, tmp_char;
		int tmp_value;

		do {
			tmp_value = value;
			value /= base;
			*ptr++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz" [35 + (tmp_value - value * base)];
		} while ( value );

		// Apply negative sign
		if (tmp_value < 0) *ptr++ = '-';
		*ptr-- = '\0';
		while(ptr1 < ptr) {
			tmp_char = *ptr;
			*ptr--= *ptr1;
			*ptr1++ = tmp_char;
		}
		return result;
	}


typedef uint64_t u64;
typedef uint32_t u32;


//src: from the kernel undervolting patch
static u64 SetBits(u64 value, u32 bits, unsigned char offset, unsigned char numBits) {
    const u64 mask = (((u64)1 << numBits) - (u64)1) << offset; // 2^numBits - 1, shifted by offset to the left
    value = (value & ~mask) | (((u64)bits << offset) & mask);
    return value;
}

int main() {
  u64 i;
  i=2147483648; //bit 31 set (bits counted from 0)
  u64 j=SetBits(0,1,31,1);
	char buffer [34];
  itoa (i,buffer,2);
  printf ("binary: %s\n",buffer);
  printf ("binary: 210987654321098765432109876543210\n",buffer);
  assert(i == j);
}

