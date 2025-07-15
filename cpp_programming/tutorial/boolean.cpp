/* Date: 22nd March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    /*boolean expression*/
    cout<< (10==15) <<"\n";
    cout<< (9>3) <<"\n";

    /*example*/
    int myAge;
    int votingAge = 25;
    cout<< "Enter your age\n";
    cin>> myAge;
    if (myAge>=votingAge){
        cout<<"You are eligible to vote.\n";
    } else{
        cout<< "You are not eligible to vote.\n";
    }
    return 0;
}