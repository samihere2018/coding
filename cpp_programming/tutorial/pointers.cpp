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

    string car = "Toyota";// A car variable of type string
    string* ptr = &car; // A pointer variable, with the name ptr, that stores the address of car

    // Output the value of car (Toyota)
    cout<<car<<"\n";

    // Output the memory address of car
    cout<<&car<<"\n";

    // Output the memory address of car with the pointer 
    cout<<ptr<<"\n";

    /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    /* you can also use the pointer to get the value of the variable, by using the * operator (the dereference operator) */
    string food = "Pizza";//variable declaration
    string* ptr1 = &food;//pointer declaration

    // Reference: Output the memory address of food with the pointer
    cout<<ptr1<<"\n";

    // Dereference: Output the value of food with the pointer (Pizza)
    cout<< *ptr1<<"\n";

    return 0;
}