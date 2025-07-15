/* Date: 30th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Functions Parameters */
/* Information can be passed to functions as a parameter.
   Parameters act as variables inside the function.
   Parameters are specified after the function name, inside the parentheses. 
   You can add as many parameters as you want, just separate them with a comma. */

/* The following example has a function that takes a string called fname as parameter. 
  When the function is called, we pass along a first name, which is used inside the function to print the full name.*/


#include <iostream>
#include <string>
#include <cmath>
using namespace std;

void lastName(string firstName){
    cout<<firstName<<" Dogbatsey\n";
}

int main() {
    lastName("Nobel");
    lastName("Matthias");
    lastName("Deborah");

    return 0;
}