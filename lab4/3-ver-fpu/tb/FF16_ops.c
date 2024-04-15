// This file is compiled as C++ and linked with stdlib
// into the simulation executable.

#include <stdio.h>
#include "/home/matteshala/questasim/include/svdpi.h"
#include "./flexfloat.h"
#include "./flexfloat.c"

#define EXP_BITS  5
#define MAN_BITS 10

extern int mul_FP16(int a, int b);

int mul_FP16(int a, int b){

	flexfloat_t FF_a, FF_b, FF_c;

	ff_init(&FF_a, (flexfloat_desc_t) {EXP_BITS, MAN_BITS});
	ff_init(&FF_b, (flexfloat_desc_t) {EXP_BITS, MAN_BITS});
	ff_init(&FF_c, (flexfloat_desc_t) {EXP_BITS, MAN_BITS});

	flexfloat_set_bits(&FF_a, a);
	flexfloat_set_bits(&FF_b, b);

	ff_mul(&FF_c, &FF_a, &FF_b);

	printf("\n");
	printf("SW\t%f*%f = %f\n", ff_get_double(&FF_a), ff_get_double(&FF_b), ff_get_double(&FF_c));
	printf("SW\t%x*%x = %x\n", (unsigned int)flexfloat_get_bits(&FF_a), (unsigned int)flexfloat_get_bits(&FF_b), (unsigned int)flexfloat_get_bits(&FF_c));

	return (unsigned int)flexfloat_get_bits(&FF_c);
}