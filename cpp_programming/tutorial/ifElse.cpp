/* Date: 22nd March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    int x = 20;
    if (x<15){
        cout<< "Good morning!\n";
    }
    else{
        cout<< "Good evening!\n";
    }

    /*alternatively: shorthand if...else statement*/
    // variable = (condition) ? expressionTrue : expressionFalse;
    int time  = 16;
    string result = (time<18) ? "Good day\n" : "Goodnight\n";
    cout<< result;
    return 0;
}