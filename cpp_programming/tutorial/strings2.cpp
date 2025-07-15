/* Date: Wednesday, 21st March, 2025 */
/* Author: Sylvia Dogbatsey */
/* Description: Second program in C++ */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
using namespace std;
#include <string> //include the string library

int main (){

    string FullName;
    cout<< "Type your full name \n";
    getline(cin, FullName);
    cout<< "Your full name is " <<FullName <<"\n";
    return 0;
}