/* Date: 4th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Multiple Inheritance */
/*                  A class can also be derived from more than one base class, using a comma-separeted list*/


#include <iostream>
#include <cmath>
#include <string>
using namespace std;


//base class
class MyCar {
    public:
      void myFunction() {
        cout<<"I used to drive a 1993 Toyoto Camry.\n";
      }
};

//base class
class MyCarColour {
    public:
      void myFunction1() {
        cout<<"It was white.\n";
      }

};

//derived class
class MyCarYear : public MyCar, public MyCarColour {
    public:
      string year = "It was manufactured in 1993.\n";
};


int main() {
    MyCarYear myObj;
    myObj.myFunction();
    myObj.myFunction1();
    cout<<myObj.year<<endl;

    return 0;
}