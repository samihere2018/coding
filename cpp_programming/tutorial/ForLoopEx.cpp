/* Date: 24th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main() {

    /*program that counts to 100 by tens*/
    for (int i = 10; i<=100; i = i+10){
        cout<< i<<"\n";
    }
    cout<<"\n";

    /*print only even numbers between 0 and 10 (inclusice)*/
    for (int j = 0; j<=10; j=j+2){
        cout<<j<<"\n";
    }
    cout<<"\n";

    /*print only odd numbers between 0 and 10*/
    for (int k = 1; k<=10; k=k+2){
        cout<<k<<"\n";
    }
    cout<<"\n";

    /*print powers of 2 up to 512*/
    for (int i = 2; i<=512; i=i*2){
        cout<<i<<"\n";
    }
    cout<<"\n";

    /*print the multiplication table for 2*/
    int number = 2;
    int i = 1;
    for (int i = 0; i<=12; i++){
        int MultTab2 = number*i;
        cout<<number<<"x"<<i<<"="<<MultTab2<<"\n";
    }

    return 0;
}