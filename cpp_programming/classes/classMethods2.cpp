/* Date: 28th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Class Methods (Outside Example)*/
/*        Methods are functions that belong to the class.*/
/*        To define a function outside the class definition, you have to declare it inside the class and 
          then define it outside of the class. This is done by specifiying the name of the class,
          followed the scope resolution :: operator, followed by the name of the function:*/

#include <iostream>
#include <cmath>
#include <string>
using namespace std;

class myClass {
    public:
      void myMethod ();
};


//method or function defined outside the class
void myClass::myMethod(){
    cout << "Hello world, I am creating classes for the first time.\n";
}

int main() {
    myClass myObj;     //create the object
    myObj.myMethod(); //class the method
    return 0;
}