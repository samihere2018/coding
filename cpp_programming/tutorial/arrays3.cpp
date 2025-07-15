/* Date: 26th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    /*get the size of an array*/
    //returns the number of elements in the array multiplied by the number of bytes for int, simply put, it returns the size of a type in bytes.
    int myNumbers[5] = {10, 20, 30, 40, 50};
    cout <<sizeof(myNumbers)<<"\n"; 
    cout<<"\n";

    /*get the actual number of elements in an array*/
    int MyNumbers[5] = {10, 20, 30, 40, 50};
    int getArrayLength = sizeof(MyNumbers)/sizeof(MyNumbers[0]);
    cout <<sizeof(getArrayLength)<<"\n";
    cout<<"\n";

    int someNumbers[5] = {30, 60, 90, 120, 150};
    for (int i=0; i<sizeof(someNumbers)/sizeof(someNumbers[0]);i++){
        cout<<someNumbers[i]<<"\n";
    }

    return 0;
}