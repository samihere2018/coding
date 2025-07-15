/* Date: 11th June, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Create a program that calculates the average of different ages */
#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
#include <vector>
using namespace std;

int main() {

    vector <int> ages = {31, 30, 33, 32, 40, 60, 36, 42, 100};
    int i = 0;
    double sum = 0.0;
    int vecLen = ages.size();
    while (i<vecLen){
        sum = sum + ages[i];
        i = i + 1;
    }

    double avgAge = sum/vecLen;
    cout<<"The average age is "<<avgAge<<"."<<endl;

    return 0;
}