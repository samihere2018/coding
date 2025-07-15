/* Date: 26th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Scope - local variables*/


#include <iostream>
#include <string>
#include <cmath>
using namespace std;

void myFunction() {

    //local variables that beling to myFunction
    int x = 5;

    //print he varibale x
    cout << x << "\n";
}

int main (){

    myFunction();
    return 0;
}