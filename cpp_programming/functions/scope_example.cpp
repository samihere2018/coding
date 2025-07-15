/* Date: 26th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Scope - naming variables*/

#include <iostream>
#include <cmath>
#include <string>
using namespace std;

//global variable
int x = 5;

void myFunction() {
    cout<<++x<<"\n"; //increment of x by 1
}

int main() {
    cout<<x<<"\n"; //returns the global variable x
    
    myFunction(); //returns increment of x
    return 0;
}