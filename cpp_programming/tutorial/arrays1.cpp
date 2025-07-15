/* Date: 25th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    /*create an array of strings*/
    string cars[4] = {"BMW", "Audi", "Toyota", "Honda"};
    cout<<cars[0]<<"\n"; //Print out the first element in the array
    cout<<"\n";

    /*create an array of numbers*/
    int numbers[5] = {40, 50, 46, 67, 100};
    cout<<numbers[4]<<"\n";
    cout<<"\n";

    /*change an array element*/
    cars[2] = "Mazda";
    cout<<cars[2]<<"\n";
    cout<<"\n";

    return 0;
}