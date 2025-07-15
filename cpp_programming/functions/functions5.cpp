/* Date: 30th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Functions : Multiple Parameters */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

void myFunction(string car, int year){
    cout<<"A "<<year<<" "<<car<<"\n";
}

int main() {
    myFunction("Toyota",1993);
    myFunction("Chevy", 2017);
    myFunction("Tesla",2025);
    myFunction("Toyota SUV",2025);

    return 0;
}