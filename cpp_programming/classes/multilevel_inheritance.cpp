/* Date: 4th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Multilevel Inheritance */
/*                  A class can also be derived from one class, which is alreadt derived from another class.
                    In the following example, MyGrandChild is derived from the class MyChild (which is derived from the class MyClass)*/

#include <iostream>
#include <cmath>
#include <string>
using namespace std;


//parent class
class MyClass {
    public:
      void myFunction() {
        cout<<"This is Grandparent!\n";
      }

};
 
//derived class from MyClass
class MyChild : public MyClass {

};

//derived class from MyChild
class MyGrandchild: public MyChild {

};

int main(){
    MyGrandchild grandchd;
    grandchd.myFunction();
    return 0;
}