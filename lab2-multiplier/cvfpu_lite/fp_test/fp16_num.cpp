#include "flexfloat.hpp"
#include <cstdio>
#include <iostream>

#define FP16_EXP_BITS 5
#define FP16_MAN_BITS 10

#define RET_OK 0
#define RET_KO_USE 1

int main(int argc, char **argv)
{

  float fa;
  float fb;
  // IEEE float16: 5 bits (exponent) + 11 bits (explicit mantissa)
  flexfloat<FP16_EXP_BITS, FP16_MAN_BITS> ff16_a;
  flexfloat<FP16_EXP_BITS, FP16_MAN_BITS> ff16_b;
  flexfloat<FP16_EXP_BITS, FP16_MAN_BITS> ff16_c;

  if (argc != 3)
  {
    printf("Use: %s <a> <b>\n", argv[0]);
    printf("Example: %s 15.0 12.5\n", argv[0]);
    return RET_KO_USE;
  }

  fa = atof(argv[1]);
  fb = atof(argv[2]);

  ff16_a = fa;
  ff16_b = fb;
  ff16_c = ff16_a * ff16_b;

  std::cout << "ff16_a = " << flexfloat_as_double << ff16_a << flexfloat_as_bits << " (" << ff16_a << ")" << std::endl;
  std::cout << "ff16_b = " << flexfloat_as_double << ff16_b << flexfloat_as_bits << " (" << ff16_b << ")" << std::endl;
  std::cout << "ff16_c = " << flexfloat_as_double << ff16_c << flexfloat_as_bits << " (" << ff16_c << ")" << std::endl;

  return RET_OK;
}
