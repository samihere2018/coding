/* Date: 11th June, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: A simple countdown to say "Surprise" */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    int countdown = 3;
    while (countdown>0){
        cout<<countdown<<endl;
        countdown--;
    }
    cout<<"Surprise!\n";

    return 0;
}