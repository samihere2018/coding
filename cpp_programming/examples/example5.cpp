/* Date: 26th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Example 5 -  Determine if an individual is of age to vote */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {
    int standardAge = 18;
    int individualAge;

    cout<<"Enter your current age: ";
    cin>>individualAge;

    if (individualAge>=18){
        cout<<"Congratualtions! You are eligible to vote.\n";
    }
    else {
        cout<<"You are not eligible to vote since you are not 18 years and above.\n";
    }

    return 0;
}
