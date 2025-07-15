/* Date: 26th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Example 7 - Find out if a number is positive or negative */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    int myNum = 0;

    if (myNum>0){
        cout<<"It's a positive integer.\n";
    }
    else if (myNum<0){
        cout<<"It's a negative integer.\n";
    }
    else {
        cout<<"It's zero!\n";
    }

    return 0;
}