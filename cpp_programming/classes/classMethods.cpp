/* Date: 28th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Class Methods (Inside Example)*/
/*                Methods are functions that belong to the class.*/

#include <iostream>
#include <cmath>
#include <string>
using namespace std;

class myClass {
    public:
      void myMethod() {
        cout << "Hello world!\n";
      }
};

int main() {
    myClass myObj;
    myObj.myMethod();
    return 0;
}