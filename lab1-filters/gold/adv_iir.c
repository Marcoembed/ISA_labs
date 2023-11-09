#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>

#define N 1 /// order of the filter
#define NTm1 (N) /// number of coeffients minus one (equal to the order)
#define NB 10  /// number of bits
#define SHAMT 9 /// shift amount (if == NB-1 does not drop bits)

const int bi[2]={215,215}; /// b array
const int ai[NTm1]={82}; /// a array
const int ai_2[NTm1]={13}; /// a array
						   //
void printArray(int *arr, int size);
void printSample(int sample);

/// Perform fixed point filtering assuming direct form II
///\param x is the new input sample
///\return the new output sample
int myfilter(int x)
{
	static int sw[7]; /// w shift register
  	static int first_run = 0; /// for cleaning the shift register
  	int i; /// index
  	int y; /// output sample
  	int w, f1, f2, f3, fb, s; /// feed-back and feed-forward results

	/// clean the buffer
  	if (first_run == 0)
  	{
  	  first_run = 1;
  	  for (i=0; i<7; i++)
  	    sw[i] = 0;
  	}

	f1 = ((x*ai[0]) >> SHAMT) << (SHAMT-NB+1);
	w = x + sw[0];
	s = sw[1] + sw[3];
	fb = ((sw[2]*ai_2[0]) >> SHAMT) << (SHAMT-NB+1);
	f3 = ((sw[2]*bi[0]) >> SHAMT) << (SHAMT-NB+1);
	f2 = ((sw[4]*bi[1]) >> SHAMT) << (SHAMT-NB+1);
	y = sw[5] + sw[6];

  	/// update the shift register
	sw[6] = f2;
	sw[5] = f3;
	sw[4] = sw[2];
	sw[3] = fb;
	sw[2] = s;
	sw[1] = w;
	sw[0] = f1; 

	// DEBUG
	//printSample(x);
	//printArray(sw, 7);
 
  	return y;
}

int main (int argc, char **argv)
{
	FILE *fp_in;
  	FILE *fp_out;

	//DEBUG
	//FILE *fp_log;
	//fp_log = fopen("registers.txt", "w+");
	//fprintf(fp_log, "REGISTERS LOG\n");

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
  		printf("Error: cannot open %s\n", argv[1]);
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

void printArray(int *arr, int size){
	FILE *fp_log;
	fp_log = fopen("registers.txt", "a");
	printf("[");
		for(int i=0; i<size; i++){
			printf("%d, ", arr[i]);
			fprintf(fp_log, "[ ");
			fprintf(fp_log, "sw[%d] = %d", i, arr[i]);
			fprintf(fp_log, "]\n");
		}
	printf("]\n");
}

void printSample(int sample){
	FILE *fp_log;
	fp_log = fopen("registers.txt", "a");
	printf("current sample = %d\n", sample);
	fprintf(fp_log, "current sample %d\n", sample);
	
}
