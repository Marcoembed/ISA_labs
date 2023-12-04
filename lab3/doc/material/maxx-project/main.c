//#define IS86

#ifdef IS86
#include <stdio.h>
#endif
#include "maxx.h"

#define R 2
#define N 4

int Li = 31;
int Lo[R] = {15, -20};
int sS[N] = {0, -1024, -512, -256};
int sE[N];

int main()
{
#ifdef IS86
  int i;
#endif

  maxx(Li, Lo, sS, sE);

#ifdef IS86
  for (i=0; i<N; i++)
    printf("%d\n", sE[i]);
#endif

  return 0;
}
