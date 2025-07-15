/* Date: 28th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Pointers */
/* A pointer however, is a variable that stores the memory address as its value.
   A pointer variable points to a data type (like int or string) of the same type, and is created with the * operator. 
   The address of the variable you're working with is assigned to the pointer.
   The type of the pointer has to match the type of the variable you're working with.
   Use the & operator to store the memory address of the variable called car, and assign it to the pointer.
   Now, ptr holds the value of car's memory address. */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    /* Modify a Pointer Value */
    string laptop = "MacBook";
    string* ptr = &laptop;

    cout<<laptop<<"\n"; // Output the value of laptop (MacBook)
    cout<<&laptop<<"\n"; // Output the memory address of laptop
    cout<<*ptr<<"\n";// Access the memory address of laptop and output its value (MacBook)

    // Change the value of the pointer
    *ptr = "Dell";

    // Output the new value of the pointer (Dell)
    cout<<*ptr<<"\n";

    // Output the new value of the laptop variable (Dell)
    cout<<laptop<<"\n";

    return 0;
}