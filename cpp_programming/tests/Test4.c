#include <stdio.h>

int main() {
    char myGrade = 'A';
    float f1 = 35e3;
    double d1 = 12E4;

    float f2 = 3.5;
    double d2 = 19.99;

    float myFloatNum = 3.5;

    printf("%c\n", myGrade);

    printf("%f\n", f1);
    printf("%lf\n", d1); // or printf("%d\n", d1);

    printf("%f\n", f2);
    printf("%lf\n", d2); // or printf("%d\n", d1);

    printf("%f\n", myFloatNum);
    printf("%.1f\n", myFloatNum);
    printf("%.2f\n", myFloatNum);
    printf("%.4f\n", myFloatNum);


    // To get the actual size (in bytes) of a data type or variable, use the "sizeof" operator
    int myInt;
    float myFloat;
    double myDouble;
    char myChar;

    printf("%lu\n", sizeof(myInt));
    printf("%lu\n", sizeof(myFloat));
    printf("%lu\n", sizeof(myDouble));
    printf("%lu\n", sizeof(myChar));

    return 0;
}