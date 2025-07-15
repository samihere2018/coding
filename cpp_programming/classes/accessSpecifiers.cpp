/* Date: 4th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Inheritance: Access Specifiers */
/*                  The other specifier apart from Public and Private is Protected (similar to private) but it can also be
                    accessed in the inherited class. */

#include <iostream>
#include <cmath>
#include <string>
using namespace std;

//base class
class Employee {
    protected:
      int salary;
};

//derived class
class Programmer : public Employee {
    public:
      int bonus;
      void setSalary(int s){
        salary = s;
      }
      int getSalary(){
        return salary;
      }
};

int main(){
    Programmer myObj;
    myObj.setSalary(120000);
    myObj.bonus = 30000;
    cout<<"salary: "<<myObj.getSalary()<<endl;
    cout<<"Bonus: "<<myObj.bonus<<endl;

    return 0;
}