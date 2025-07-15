/* Date: 26th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Scope - naming variables*/

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

//global variable
int xyz = 32;

void myFunction(){

    //here, xyz is a local variable
    int xyz = 31;
    cout << xyz <<"\n";
}

int main() {
    //returns the value of xyz in myFunction
    myFunction();

    //returns the global variable xyz
    cout<<xyz<<"\n";

    return 0;
}