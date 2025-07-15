/* Date: 7th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Exceptions */
/* Notes: When executing C++ code, different errors can occur: coding errors made by the programmer, 
          errors due to wrong input, or other unforeseeable things.
          When an error occurs, C++ will normally stop and generate an error message. 
          The technical term for this is: C++ will throw an exception (throw an error).

          *** C++ try and catch
              Exception handling in C++ consist of three keywords: try, throw and catch:
              The try statement allows you to define a block of code to be tested for errors while it is being executed.
              The throw keyword throws an exception when a problem is detected, which lets us create a custom error.
              The catch statement allows you to define a block of code to be executed, if an error occurs in the try block.
              The try and catch keywords come in pairs */
/* Example of Structure: try {
                                // Block of code to try
                        throw exception; // Throw an exception when a problem arise
                        }
                        catch () {
                             // Block of code to handle errors
                        } */

#include <iostream>
#include <cmath>
#include <string>
#include <fstream>
using namespace std;

int main() {
    try{
        int age = 15;
        if (age>=18){
            cout<<"Access granted!\n";
        }
        else{
            throw(age);
        }
    }
    catch(int myNum){
        cout<<"Access denied: you must be 18 years or older!\n";
        cout<<"Age is: "<< myNum<<endl;
    }

    /* If you do not know the throw type used in the try block, you can use the "three dots" syntax (...) inside the catch block, 
    which will handle any type of exception. */

    try{
        int age = 22;
        if (age>=21){
            cout<<"Here you go! Thank you for your purchase!\n";
        }
        else{
            throw 505;
        }
    }
    catch(...){
        cout<<"Access denied: you must be 21 years or older!\n";
    }

    return 0;
}