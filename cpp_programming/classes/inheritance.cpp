/* Date: 1st May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Inheritance */
/*                  In C++, it is possible to inherit attributes and methods from one class to another. 
                    We group the "inheritance concept" into two categories:
                    derived class (child) - the class that inherits from another class
                    base class (parent) - the class being inherited from
                    To inherit from a class, use the : symbol.
                    In the example below, the Car class (child) inherits the attributes and methods from the Vehicle class (parent) 
                    It is useful for code reusability: reuse attributes and methods of an existing class when you create a new class. */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;


//base class
class Vehicle {
    public:
      string make = "Toyota";
      void year(){
        cout <<"1993";
      }
};

//derived class
class car: public Vehicle {
    public:
      string model = "Camry";
};

int main() {
    car myCar;
    myCar.year();
    cout<<" "<<myCar.make<<" "<<myCar.model<<endl;
    return 0;
}