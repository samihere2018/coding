/* Date: 27th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Enumeration (Enums) (Notes from W3 schools)*/

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

enum Level{
    LOW=1,
    MEDIUM,
    HIGH
};

int main(){
    enum Level myVar = HIGH;
    switch(myVar){
        case 1:
        cout<<"Low level\n";
        break;
        case 2:
        cout<<"Medium level\n";
        break;
        case 3:
        cout<<"High level\n";
        break;
    }

    return 0;
}