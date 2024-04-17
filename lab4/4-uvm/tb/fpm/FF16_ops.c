// This file is compiled as C++ and linked with stdlib
// into the simulation executable.

#include <stdio.h>
#include "./flexfloat.h"
#include "./flexfloat.c"

#define EXP_BITS  5
#define MAN_BITS 10

extern int mul_FP16(int a, int b);
extern int add_FP16(int b, int c);

int mul_FP16(int a, int b){

	flexfloat_t FF_a, FF_b, FF_r;

	ff_init(&FF_a, (flexfloat_desc_t) {EXP_BITS, MAN_BITS});
	ff_init(&FF_b, (flexfloat_desc_t) {EXP_BITS, MAN_BITS});
	ff_init(&FF_r, (flexfloat_desc_t) {EXP_BITS, MAN_BITS});

	flexfloat_set_bits(&FF_a, a);
	flexfloat_set_bits(&FF_b, b);

	ff_mul(&FF_r, &FF_a, &FF_b);

	if(isnan(ff_get_double(&FF_r))) {
		flexfloat_set_bits(&FF_r, 0x7e00);
	}

	printf("\n");
	printf("SW\t%f * %f = %f\n", ff_get_double(&FF_a), ff_get_double(&FF_b), ff_get_double(&FF_r));
	printf("SW\t%x * %x = %x\n", (unsigned int)flexfloat_get_bits(&FF_a), (unsigned int)flexfloat_get_bits(&FF_b), (unsigned int)flexfloat_get_bits(&FF_r));

	return (unsigned int)flexfloat_get_bits(&FF_r);
}

int add_FP16(int b, int c){

	flexfloat_t FF_b, FF_c, FF_r;

	ff_init(&FF_b, (flexfloat_desc_t) {EXP_BITS, MAN_BITS});
	ff_init(&FF_c, (flexfloat_desc_t) {EXP_BITS, MAN_BITS});
	ff_init(&FF_r, (flexfloat_desc_t) {EXP_BITS, MAN_BITS});

	flexfloat_set_bits(&FF_b, b);
	flexfloat_set_bits(&FF_c, c);

	ff_add(&FF_r, &FF_b, &FF_c);

	if(isnan(ff_get_double(&FF_r))) {
		flexfloat_set_bits(&FF_r, 0x7e00);
	}

	printf("\n");
	printf("SW\t%f + %f = %f\n", ff_get_double(&FF_b), ff_get_double(&FF_c), ff_get_double(&FF_r));
	printf("SW\t%x + %x = %x\n", (unsigned int)flexfloat_get_bits(&FF_b), (unsigned int)flexfloat_get_bits(&FF_c), (unsigned int)flexfloat_get_bits(&FF_r));

	return (unsigned int)flexfloat_get_bits(&FF_r);
}