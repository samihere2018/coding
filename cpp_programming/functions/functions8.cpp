/* Date: 31st March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Functions : Pass Arrays as Function Parameters */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

void myFunction(int myNumbers[5]){
    for (int i=0;i<5;i++){
        cout<<myNumbers[i]<<"\n";
    }
}

int main() {
    int myNumbers[5] = {23, 45, 80, 40, 4};
    myFunction(myNumbers);
    return 0;
}

