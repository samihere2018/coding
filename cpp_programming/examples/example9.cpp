/* Date: 11th June, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Example 9 - Use the weekday number to calculate and output the weekday name */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    int numberDay;
    cout<<"Enter any number from 1 to 7 corresponding to the day of the week. Monday is represented by 1. Tuesday is 2 and so on.\n";
    cin>>numberDay;
    switch (numberDay){
        case 1:
            cout<<"Monday\n";
            break;
        case 2:
            cout<<"Tuesday\n";
            break;
        case 3:
            cout<<"Wednesday\n";
            break;
        case 4:
            cout<<"Thursday\n";
            break;
        case 5:
            cout<<"Friday\n";
            break;
        case 6:
            cout<<"Saturday\n";
            break;
        case 7:
            cout<<"Sunday\n";
            break;
    }

    return 0;
}

