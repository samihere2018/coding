/* Date: 30th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Functions : Return Keyword */
/* If you want the function to return a value, you can use a data type (such as int, string, etc.) instead of void, 
   and use the return keyword inside the function. */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

//the function returns the sum of two input arguments
int sumFunction(int x, int y){
    return x + y;
}

int main() {
    cout<<sumFunction(3,4)<<"\n";
    cout<<sumFunction(100,405)<<"\n";
    cout<<sumFunction(0,0)<<"\n";
    cout<<sumFunction(-5,1)<<"\n";
    int z = sumFunction(30,31);
    cout<<z<<"\n";

    return 0;
}