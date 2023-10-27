#include<stdio.h>
#include<stdlib.h>

#define N 1 /// order of the filter
#define NTm1 (N) /// number of coeffients minus one (equal to the order)
#define NB 10  /// number of bits
#define SHAMT 9 /// shift amount (if == NB-1 does not drop bits)

const int bi0 = 215; /// coefficient b0
const int bi[NTm1]={215}; /// b array
const int ai[NTm1]={-82}; /// a array

/// Perform fixed point filtering assuming direct form II
///\param x is the new input sample
///\return the new output sample
int myfilter(int x)
{
  static int sw[NTm1]; /// w shift register
  static int first_run = 0; /// for cleaning the shift register
  int i; /// index
  int w; /// intermediate value (w)
  int y; /// output sample
  int fb, ff; /// feed-back and feed-forward results

  /// clean the buffer
  if (first_run == 0)
  {
    first_run = 1;
    for (i=0; i<NTm1; i++)
      sw[i] = 0;
  }

  /// compute feed-back and feed-forward
  fb = 0;
  ff = 0;
  for (i=0; i<NTm1; i++)
  {
    fb -= ((sw[i]*ai[i]) >> SHAMT) << (SHAMT-NB+1);    
    ff += ((sw[i]*bi[i]) >> SHAMT) << (SHAMT-NB+1);    
  }

  /// compute intermediate value (w) and output sample
  w = x + fb;
  y = ((w*bi0) >> SHAMT) << (SHAMT-NB+1);    
  y += ff;

  /// update the shift register
  for (i=NTm1; i>0; i--)
    sw[i] = sw[i-1];
  sw[0] = w;
 
  return y;
}

int main (int argc, char **argv)
{
  FILE *fp_in;
  FILE *fp_out;

  int x;
  int y;

  /// check the command line
  if (argc != 3)
  {
    printf("Use: %s <input_file> <output_file>\n", argv[0]);
    exit(1);
  }

  /// open files
  fp_in = fopen(argv[1], "r");
  if (fp_in == NULL)
  {
    printf("Error: cannot open %s\n");
    exit(2);
  }
  fp_out = fopen(argv[2], "w");

  /// check shift amount
  if (SHAMT < ((NB)-1))
  {
    printf("Error: shift amount must be at least nbit-1\n");
    exit(3);
  }  

  /// get samples and apply filter
  fscanf(fp_in, "%d", &x);
  do{
    y = myfilter(x);
    fprintf(fp_out,"%d\n", y);
    fscanf(fp_in, "%d", &x);
  } while (!feof(fp_in));

  fclose(fp_in);
  fclose(fp_out);

  return 0;

}
