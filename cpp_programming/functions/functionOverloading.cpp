/* Date: 31st March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Functions : Function Overloading */
/* With function overloading, multiple functions can have the same name with different parameters. */
/* Multiple functions can have the same name as long as the number and/or type of parameters are different. */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int myFunc(int x, int y){
    return x+y;
}

double myFunc(double x, double y){
    return x + y;
}

int main() {

    int result1 = myFunc(3,5);
    double result2 = myFunc(3.6,7.9);

    cout<<"Int: "<<result1<<"\n";
    cout<<"Double: "<<result2<<"\n";

    return 0;
}