/* Date: 11th June, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Create a program that finds the lowest age among different ages. */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
#include <vector>
using namespace std;

int main() {

    vector <int> ages = {31, 30, 33, 12, 40, 5, 36, 42, 100, 8, 32, 60};
    int smallAge = 1000; //no individual in th eworld today is 1000 years old.
    int vecLen = ages.size();
    int i = 1;
    while(i<vecLen){
        if (ages[i]<smallAge){
            smallAge = ages[i];
        }
        i = i + 1;
    }
    cout<<"The smallest age in the group is "<<smallAge<<"."<<endl;

    return 0;
}