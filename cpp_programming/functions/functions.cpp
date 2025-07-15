/* Date: 30th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Functions */
/* To create (often referred to as declare) a function, specify the name of the function, followed by parentheses (). */
/* myFunction() is the name of the function. 
   void means that the function does not have a return value.
   To call a function, write the function's name followed by two parentheses () and a semicolon ;  
   If a user-defined function, such as myFunction() is declared after the main() function, an error will occur. */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

// Create a function
void myFunction() {
    cout << "My name is Sylvia Dogbatsey.\n";
}

int main() {
    myFunction(); //Call the function
    myFunction(); //a function can be called multiple times
    myFunction(); //a function can be called multiple times

    return 0;
}
