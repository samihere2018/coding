/* Date: 26th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Example 2 - area of a rectangle */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    int length;
    int width;
    int area;

    cout<<"Enter the lenfth of the rectangle: ";
    cin>>length;
    cout<<"Enter the width of the rectangle: ";
    cin>>width;
    
    area = length * width;

    cout<<"The area of the rectangle is: "<<area<<" square units.\n";

    return 0;
}