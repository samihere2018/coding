/* Date: 28th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes (multiple objects for a class)*/

#include <iostream>
#include <cmath>
#include <string>
using namespace std;

class classCars {
    public:
      string brand;
      string model;
      int year;
};

int main() {
    //create object 1
    classCars carsSet1;
    carsSet1.brand = "Toyota";
    carsSet1.model = "Camry";
    carsSet1.year = 1993;

    //create object 2
    classCars carsSet2;
    carsSet2.brand = "Chevrolet";
    carsSet2.model = "Cruze Premier";
    carsSet2.year = 2017;

    cout << carsSet1.year << " " << carsSet1.brand << " " << carsSet1.model <<endl;
    cout << carsSet2.year << " " << carsSet2.brand << " " << carsSet2.model <<endl;

    return 0;
}