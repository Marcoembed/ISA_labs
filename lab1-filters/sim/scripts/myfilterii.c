#include<stdio.h>
#include<stdlib.h>

#define DEBUG (0)

#define N 1			// order of the filter
#define NTm1 (N)	// number of coeffients minus one (equal to the order)
#define NB 10		// number of bits
#define SHAMT 13	// shift amount (to drop digits)

#define INFILE  "./samples.txt"
#define OUTFILE "./artifacts/output13.txt"

const int bi0 = 215;			// coefficient b0
const int bi[NTm1] = {215};		// b array
const int ai[NTm1] = {82};		// a array

// Perform fixed point filtering assuming direct form II
// x is the new input sample
// return the new output sample
int myfilter(int x) {
	static int sw[NTm1];		// w shift register
	static int first_run = 0;	// for cleaning the shift register
	int i;		// index
	int w;		// intermediate value
	int wb;		// intermediate value multiplied by b0
	int y;		// output sample
	int fb, ff;	// feed-back and feed-forward results

	// clean the buffer
	if (first_run == 0) {
		first_run = 1;

		for (i=0; i<NTm1; i++) {	// if N=1, done just once
			sw[i] = 0;
		}
	}

	// compute feed-back and feed-forward
	fb = 0;
	ff = 0;
	for (i=0; i<NTm1; i++) {
		fb += ((sw[i]*ai[i]) >> SHAMT) << (SHAMT-NB+1);
		ff += ((sw[i]*bi[i]) >> SHAMT) << (SHAMT-NB+1);
	}

	// compute intermediate value (w) and output sample
	w = x + fb;
	wb = ((w*bi0) >> SHAMT) << (SHAMT-NB+1);
	y = wb + ff;


	// update the shift register
	for (i=NTm1; i>0; i--) {
		sw[i] = sw[i-1];
	}

	sw[0] = w;

	// debug purposes
	if DEBUG {
		printf("x = % 4d\tfb = % 4d\tff = % 4d\tw = % 4d\twb = % 4d\tsw1 = % 4d\ty = % 4d \n", x, fb, ff, w, wb, sw[1], y);
	} else {
		printf("%d ", y);
	}

	return y;
}

int main (int argc, char **argv) {
	FILE *fp_in;
	FILE *fp_out;

	int x;
	int y;


	// open files
	fp_in = fopen(INFILE, "r");
	if (fp_in == NULL) {
		printf("Error: cannot open %s\n", argv[1]);
		exit(2);
	}

	fp_out = fopen(OUTFILE, "w");

	// check shift amount
	if (SHAMT < ((NB)-1)) {
		printf("Error shift amount must be at least nbit-1\n");
		exit(3);
	}

	// get samples and apply filter
	fscanf(fp_in, "%d", &x);
	do {
		y = myfilter(x);
		fprintf(fp_out,"%d\n", y);
		fscanf(fp_in, "%d", &x);
	} while (!feof(fp_in));

	fclose(fp_in);
	fclose(fp_out);

	return 0;

}
