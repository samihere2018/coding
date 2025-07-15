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
   If a user-defined function, such as myFunction() is declared after the main() function, an error will occur.
   However, it is possible to separate the declaration and the definition of the function - for code optimization. */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

//function declaration
void myFunction();

int main() {
    myFunction();
    return 0;
}

//function definition
void myFunction(){
    cout<<"My name is Sylvia Dogbatsey.\n";
}