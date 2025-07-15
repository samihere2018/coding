/* Date: 24th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main () {
    int myNumbers[5] = {10, 20, 30 ,40, 50};
    for (int i : myNumbers) {
        cout<< i<<"\n";
    }

    return 0;
}