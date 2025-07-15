#include <stdio.h>

int main(){
    // generate the variables
    int length = 6;
    int width = 4;
    int area;

    // calculate the area of the rectangle
    area = length * width;

    // print the variables and results
    printf("Length = %d\n", length);
    printf("Width = %d\n", width);
    printf("Area = %d\n", length * width);

    return 0;
}