/* Date: 30th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Constructors*/
/*        A constructor in C++ is a special method that is automatically called when an object of a class is created.
          To create a constructor, use the same name as the class, followed by parentheses () */

#include <iostream>
#include <cmath>
#include <string>
using namespace std;

class myClass {
    public:
      myClass() {
        cout <<"Hello world!\n";
      }

};

int main() {
    myClass myObj;
    return 0;
}