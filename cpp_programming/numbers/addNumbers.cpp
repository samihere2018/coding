/* Date: 24th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Add Two Numbers*/

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {
    int x, y;
    cout<<"Enter a number: ";
    cin>>x;
    cout<<"Enter another number: ";
    cin>>y;
    int sum = x + y;
    cout<<"The sum of the two numbers is: "<< sum <<endl;
    return 0;
}