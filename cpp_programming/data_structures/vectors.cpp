/* Date: 9th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures (Vector) */
/* Notes: A vector in C++ is like a resizable array.     
          Both vectors and arrays are data structures used to store multiple elements of the same data type.
          The difference between an array and a vector, is that the size of an array cannot be modified (you cannot add or remove elements from an array). 
          A vector however, can grow or shrink in size as needed. 
          To create a vector, use the vector keyword, and specify the type of values it should store within angle brackets <> and 
          then the name of the vector, like: vector<type> vectorName. 
          If you want to add elements at the time of declaration, place them in a comma-separated list, inside curly braces {}. 
          You can access a vector element by referring to the index number inside square brackets []. 
          Vectors, like arrays, are 0-indexed, meaning that [0] is the first element, [1] is the second element, and so on. */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
#include <vector> //library for the vector data structure
using namespace std;

int main() {

    /* a vector of schools in Ghana and USA*/
    vector<string> schools = {"UG", "KNUST", "UCC", "UA", "SMU", "UMBC"};

    /* access the first element */
    cout<<"I attended "<<schools[0]<<" from 2012 to 2016."<<endl;

    /* access the 4th element */
    cout<<"I attended "<<schools[3]<<" from 2018 to 2024."<<endl;

    /* access the 5th element */
    cout<<"I am doing my postdoc training at "<<schools[4]<<".\n";

    /* access the 6th element */
    cout<<"I will conintue my training at "<<schools[5]<<" in Fall 2025.\n";

    /* You can access the first or the last element of a vector with the .front() and .back() functions */
    cout<<schools.front()<<endl;
    cout<<schools.back()<<endl;

    /* To access an element at a specified index, you can use the .at() function and specify the index number. */
    cout<<schools.at(3)<<endl;
    
    /* The .at() function is often preferred over square brackets [] because it lets you know if an error occurs.*/
    cout<<schools[7]<<endl;
    cout<<schools.at(7)<<endl;

    return 0;
}