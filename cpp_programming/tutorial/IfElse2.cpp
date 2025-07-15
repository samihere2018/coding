/* Date: 22nd March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main() {
    int doorCode;
    cout<< "Enter the door code.\n";
    cin>> doorCode;
    if (doorCode == 26122024){
        cout<< "Correct code!\n The door is now open.\n";
    }
    else{
        cout<< "Wrong code!\n Try again!\n";
    }

    /*alternatively: short hand*/
    int doorCode2;
    cout<< "Enter the door code.\n";
    cin>> doorCode2;
    string result = (doorCode2 == 31122024) ? "Correct code!\n The door is now open.\n" : "Wrong code!\n Try again!\n";
    cout<< result;
    return 0;
}