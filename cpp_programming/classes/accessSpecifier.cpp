/* Date: 30th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Access Specifier*/
/*        The public keyword is an access specifier. Access specifiers define how the members (attributes and methods) of a class can be accessed. 
          In the example above, the members are public - which means that they can be accessed and modified from outside the code.
          However, what if we want members to be private and hidden from the outside world?
          In C++, there are three access specifiers:
              public - members are accessible from outside the class
              private - members cannot be accessed (or viewed) from outside the class
              protected - members cannot be accessed from outside the class, however, they can be accessed in inherited classes. */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

class myClass{
    public:  // Public access specifier
      int x; // Public attribute
    private: // Private access specifier
      int y; // Private attribute

};

int main() {

    myClass myObj;
    myObj.x = 30;  // Allowed (public)
    cout<<myObj.x<<endl;
    
    /* when the next two lines are run, an error occurs because the variable y is declared private */
    // myObj.y=40;  // Not allowed (private)     
    // cout<<myObj.y<<endl;              
    return 0;
}