/* Date: 26th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Example 6 - Enter a door code */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    int doorCode = 205678;
    int yourCode;

    cout<<"Enter the door code: ";
    cin>>yourCode;

    if (yourCode==doorCode){
        cout<<"Access granted!\n";
    }
    else {
        cout<<"Wrong code! Access denied!\n";
    }

    return 0;
}