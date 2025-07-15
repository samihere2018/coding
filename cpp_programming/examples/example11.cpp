/* Date: 11th June, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Create a program that only print even numbers between 0 and 10 (inclusive) 
          Use a for loop to create a program that counts to 100 by tens. 
          Use a for loop to print the powers of 2 up to 512. 
          Use a for loop to create a program that prints the multiplication table of a specified number. */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {
    
    cout<<"Create a program that only print even numbers between 0 and 10 (inclusive).\n";
    for (int i =0 ; i < 11; i++){
        if (i%2==0){
            cout<<i<<endl;
        }
    }

    cout<<" "<<endl;
    cout<<"Use a for loop to create a program that counts to 100 by tens.\n";
    int k = 10;
    while(k<101) {
        cout<<k<<endl;
        k = k+10;
    }

    cout<<" "<<endl;
    cout<<"Use a for loop to print the powers of 2 up to 512.\n";
    for(int kk=2; kk<=512; kk*=2) {
        cout<<kk<<endl;
    }

    cout<<" "<<endl;
    cout<<"Use a for loop to create a program that prints the multiplication table (1 to 12) of a specified number (4 in this example).\n";
    int num;
    cout<<"Enter the number whose multiplication table (1 to 12) you want.";
    cin>>num;

    int num_prod;
    
    for (int i = 1; i<=12;i++){
        num_prod = num*i;
        cout<<num<< " times "<<i<<" = " <<num_prod<<endl;
    }

    return 0;
}
