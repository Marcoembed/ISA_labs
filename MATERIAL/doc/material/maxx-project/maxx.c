#include"maxx.h"

#define mymax(x,y) ( (x) < (y) ? (y) : (x) )
#define myabs(x) ( ((x) < 0) ? (-(x)) : (x) )
#define myfc(x,y) ( myabs((x)-(y)) < 16 ? 3 : 0 )
#define mymaxx(x,y) ( mymax((x),(y)) + myfc((x),(y)) )

void maxx(int pLi, int *pLo, int *psS, int *psE)
{
  int gmi, gmo1, gmo2, gmo3;

  gmi = pLi;
  gmo1 = pLo[0] + pLi;
  gmo2 = pLo[1];
  gmo3 = gmo1 + gmo2;

  psE[0] = mymaxx(psS[0], gmo3+psS[1]);
  psE[1] = mymaxx(gmo2+psS[3], gmo1+psS[2]);
  psE[2] = mymaxx(psS[1], gmo3+psS[0]);
  psE[3] = mymaxx(gmo2+psS[2], gmo1+psS[3]);
}
