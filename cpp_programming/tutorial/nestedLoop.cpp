/* Date: 24th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    for (int i=1; i<=2; i++){
        cout<< "Outer loop: "<<i<<" \n";

        for (int j=1; j<=3; j++){
            cout<<"Inner loop: "<<j<<" \n";
        }
    }

    return 0;
}