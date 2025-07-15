/* Date: 30th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Functions - Default Parameter */
/* You can also use a default parameter value, by using the equals sign (=). */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

void  myCountry(string countryName = "Ghana"){
    cout<<countryName<<"\n";
}

int main() {
    myCountry("Nigeria");
    myCountry("USA");
    myCountry();
    myCountry("Israel");

    return 0;
}