#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "matrix.h"

float ValMatr[30];

void MatrixFunction(){
    int I = 0;
    printf("Start example with matrix. \n");
    for(I=0; I < 29; I++) {
        ValMatr[I] = 20 * sin(I/10.0);
    }
    printf(" %f.\n",ValMatr[0]);
}
