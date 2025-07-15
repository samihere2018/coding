#include <complex.h> 
#include <stdio.h> 
  
int main() 
{ 
    double complex 
        z = 3.2 + 4.1 * I; 
  
    // Creates complex number 
    // with 3.2 and 4.1 as 
    // real and imaginary parts 
    printf("z = %.1f% + .1fi\n", creal(z), cimag(z)); 
    printf("real z = %.1f \n", creal(z)); 
    printf("imaginary z = %.1f \n", cimag(z)); 
    // printf(z);
    // printf("abs value %f", cabs(z));
} 