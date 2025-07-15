/* Date: 12th June, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Use a structure to store and output different information about Cars. */
#include <iostream>
#include <string>
#include <cmath>
#include <ctime>
#include <fstream>
using namespace std;

struct car {
    string brand;
    string model;
    int year;
};

int main() {

    car myCar1;
    myCar1.brand = "Toyota";
    myCar1.model = "Camry";
    myCar1.year  = 1993;

    car myCar2;
    myCar2.brand = "Chevrolet";
    myCar2.model = "Cruze";
    myCar2.year  = 2017;

    cout<<myCar1.year<<" "<<myCar1.brand<<" "<<myCar1.model<<endl;
    cout<<myCar2.year<<" "<<myCar2.brand<<" "<<myCar2.model<<endl;

    return 0;
}

