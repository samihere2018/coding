/* Date: 26th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Scope - recursion*/

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int sum(int k){
    if (k>0){
        return k + sum(k-1);
    }
    else{
        return 0;
    }
}

int main() {
    int result = sum(100);
    cout<<result<<"\n";
    return 0;
}