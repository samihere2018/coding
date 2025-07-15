/* Date: 23rd March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main() {
    int dayNumber;
    cout<< "Enter the number corresponding to the weekend:\n";
    cin>> dayNumber;
    switch (dayNumber){

        case 6:
        cout<< "It's Saturday.\n";
        break;
        
        case 7:
        cout<< "It's Sunday.\n";
        break;

        default:
        cout<< "Have a great day!\n";
    }

    return 0;
}