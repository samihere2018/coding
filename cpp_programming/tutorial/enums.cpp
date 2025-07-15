/* Date: 27th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Enumeration (Enums) (Notes from W3 schools)*/

#include <iostream>
#include <cmath>
#include <string>
using namespace std;

enum Level{
    LOW,
    MEDIUM,
    HIGH
};

enum Level1{
    LOW1 = 50,
    MEDIUM1 = 100,
    HIGH1 = 100
};

enum Level2{
    LOW2 = 29,
    MEDIUM2,
    HIGH2
};

int main(){

    enum Level myVar = MEDIUM;
    cout<<myVar<<"\n";
    cout<<"\n";

    enum Level1 myVar1 = HIGH1;
    cout<<myVar1<<"\n";
    cout<<"\n";

    enum Level2 myVar2 = MEDIUM2;
    cout<<myVar2<<"\n";
    cout<<"\n";

    return 0;
}