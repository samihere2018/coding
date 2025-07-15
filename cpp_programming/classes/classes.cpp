/* Date: 28th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes*/

#include <iostream>
#include <cmath>
#include <string>
using namespace std;

 class my1stClass {        //the class
    public:                //access specifier
      int myNum;           //attribute (int variable)
      string myString;     //attribute (string variable)
 };

int main() {
    my1stClass myObj; //create an object of my1stClass

    //access attributes and set values
    myObj.myNum = 30;
    myObj.myString = "My husband is 30 years old.";

    cout << myObj.myNum << endl;
    cout <<myObj.myString <<endl;

    return 0;
}
