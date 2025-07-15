/* Date: Wednesday, 19th March, 2025 */
/* Author: Sylvia Dogbatsey */
/* Description: Second program in C++ */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
using namespace std;

int main(){
    float x;
    float MonthlySavings;
    cout<< "Input the amount of money you want to have in your savings by Dec 31st if today is January 1st \n ";
    cin>> x;
    MonthlySavings = x/12.0;
    cout<< "You should save " <<MonthlySavings<< " dollars monthly, in order to have " << x << " dollars in your savings account by December 31st.\n";
    return 0;
}