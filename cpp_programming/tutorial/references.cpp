/* Date: 28th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: References */
/* A reference variable is a "reference" to an existing variable, and it is created with the & operator. */
/* In the example from the previous page, the & operator was used to create a reference variable. 
   But it can also be used to get the memory address of a variable; which is the location of where the variable is stored on the computer.
   When a variable is created in C++, a memory address is assigned to the variable. 
   And when we assign a value to the variable, it is stored in this memory address.
   To access it, use the & operator, and the result will represent where the variable is stored:*/

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    /* create references */
    string food = "Jollof rice";
    string &meal = food;

    cout<<food<<"\n";
    cout<<meal<<"\n";

    /* memory address */
    cout<<&food<<"\n"; //where the value of food is stored or outputs the memory address of food

    return 0;
}