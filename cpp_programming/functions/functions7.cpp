/* Date: 30th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Function : Pass by Reference*/
/* You can also pass a reference to the function. 
   This can be useful when you need to change the value of the arguments. */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

void swapNums(int &x, int &y){
    int z = x;
    x = y;
    y = z;
}

void myGreeting(string &str){
    str += "Sylvia!\n";
}

int main(){
    //swapping numbers
    int firstnum = 10;
    int secondnum = 20;

    cout <<"Before swap: "<<firstnum<<" "<<secondnum<<"\n";

    swapNums(firstnum, secondnum); //because it's a reference, you dont't have to use exact int values, you can use the names firstnum and second num without any error saying that the inputs are not ints
    cout<<"After swap: "<<firstnum<<" "<<secondnum<<"\n";

    //greetings
    string greeting = "Good morning, ";
    myGreeting(greeting);
    cout<<greeting;

    return 0;
}