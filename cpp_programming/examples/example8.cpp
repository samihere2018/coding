/* Date: 26th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Example 8 - Find out if a number is even or odd */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    int myNum;

    cout<<"Enter a number: ";
    cin>>myNum;

    if (myNum % 2 == 0){
        cout<<myNum<<" is an even number\n";
    }
    else {
        cout<<myNum<<" is an odd number.\n";
    }
    
    return 0;
}