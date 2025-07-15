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
    cout<< "Enter the number corresponding to the weekday:\n";
    cin>> dayNumber;
    switch (dayNumber){

        case 1:
        cout<< "It's Monday.\n";
        break;
        
        case 2:
        cout<< "It's Tuesday.\n";
        break;

        case 3:
        cout<< "It's Wednesday.\n";
        break;

        case 4:
        cout<< "It's Thursday.\n";
        break;

        case 5:
        cout<< "It's Friday.\n";
        break;
    }

    return 0;
}