#include <complex.h> 
#include <stdio.h> 
  
int main() 
{ 
    float Hess[5][5] = { {0.8147, 0.0975, 01.576, 0.1419, 0.6557}, 
                        {0.9058, 0.2785, 0.9706, 0.4218, 0.0357},
                        {0.1270, 0.5469, 0.9572, 0.9157, 0.8491},
                        {0.9134, 0.9575, 0.4854, 0.7922, 0.9340},
                        {0.6324, 0.9649, 0.8003, 0.9595, 0.6787} };

    int i, j;
    for (i = 0; i<5;  i++) {
        for (j = 0; j<5; j++) {
            printf("The Hessenberg matrix entry row: %d, column %d: %f\n", i, j, Hess[i][j]);
        }
    }

    return 0;
} 