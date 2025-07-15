/* Date: 12th June, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Create a program that doubles a number. */
#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {
    float x;
    cout<<"Enter the number you want to double: ";
    cin>> x;

    float doubleX = 2.0*x;
    cout<<"Tshe double of "<<x<<" is "<<doubleX<<"."<<endl;

    return 0;
}