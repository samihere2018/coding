/* Date: 12th June, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Create a program that converts a value from fahrenheit to celsius. */
#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    double temp;
    cout<<"Enter the temperature you want to convert from fahrenheit to celsius.";
    cin>> temp;

    double celsiusVal = (temp -32)*(5.0/9.0);

    cout<<temp<<" in celsius is "<<celsiusVal<<" degrees."<<endl;

    return 0;
}