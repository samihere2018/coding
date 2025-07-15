/* Date: 27th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Structures (Notes from W3 schools)*/
/* Structures (also called structs) are a way to group several related variables into one place. 
   Each variable in the structure is known as a member of the structure.
   Unlike an array, a structure can contain many different data types (int, string, bool, etc.)
   To create a structure, use the struct keyword and declare each of its members inside curly braces.
   To access members of a structure, use the dot syntax (.). */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

/* Named Structures */
struct car {
    string brand;
    string model;
    int year;
};

int main(){

    car myCar1;
    myCar1.brand = "Toyota";
    myCar1.model = "Camry";
    myCar1.year = 1993;

    car myCar2;
    myCar2.brand = "Chevy";
    myCar2.model = "Cruze Premier";
    myCar2.year = 2017;

    cout<<"My first car was a "<<myCar1.year<<" "<<myCar1.brand<<" "<<myCar1.model<<".\n";
    cout<<"My second car is a "<<myCar2.year<<" "<<myCar2.brand<<" "<<myCar2.model<<".\n";

    return 0;
}
   