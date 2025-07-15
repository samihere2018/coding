/* Date: 26th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Scope - global variables*/

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

//global variable
int xy = 10;

void myFunction() {
    //we can use xy here
    cout << xy <<"\n";
}

int main() {

    myFunction ();

    //we can also use xy here
    cout << xy<<"\n";

    return 0;
}