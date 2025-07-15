/* Date: 7th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Polymorphism */
/*                  Polymorphism means "many forms", and it occurs when we have many classes that are related to each other by inheritance.
                    Like we specified in the previous chapter; Inheritance lets us inherit attributes and methods from another class.
                    Polymorphism uses those methods to perform different tasks. 
                    This allows us to perform a single action in different ways.
                    It is useful for code reusability: reuse attributes and methods of an existing class when you create a new class.
                    For example, think of a base class called Animal that has a method called animalSound(). 
                    Derived classes of Animals could be Pigs, Cats, Dogs, Birds,
                    and they also have their own implementation of an animal sound (the pig oinks, and the cat meows, etc.)*/

#include <iostream>
#include <cmath>
#include <string>
using namespace std;

//base class
class Cars {
    public:
      void MakeModel(){
        cout<<"Every car brand has different models of its cars.\n";
      }
};

//derived class
class Toyota : public Cars {
    public:
      void MakeModel() {
        cout<<"Camry is a model of the car brand Toyota.\n";
      }
};

//derived class
class Kia : public Cars {
    public:
      void MakeModel() {
        cout<<"Rio is a model of the car brand Kia.\n";
      }
};

//derived class
class Nissan : public Cars {
    public:
      void MakeModel() {
        cout<<"Altima is a model of the car brand Nissa.\n";
      }
};

//derived class
class Honda : public Cars {
    public:
      void MakeModel() {
        cout<<"Civic is a model of the car brand Honda.\n";
      }
};

//derived class
class Hyundia : public Cars {
    public:
      void MakeModel() {
        cout<<"Tucson is a model of the car brand Hyundia.\n";
      }
};

//derived class
class Tesla : public Cars {
    public:
      void MakeModel() {
        cout<<"Model S is a model of the car brand Tesla.\n";
      }
};

//derived class
class Chevrolet : public Cars {
    public:
      void MakeModel() {
        cout<<"Cruze is a model of the car brand Chevrolet.\n";
      }
};

int main() {
    Cars myCar;
    Toyota myToyota;
    Tesla myTesla;
    Chevrolet myChevy;
    Honda myHonda;
    Hyundia myHyundia;
    Nissan myNissan;
    Kia myKia;

    myCar.MakeModel();
    myToyota.MakeModel();
    myTesla.MakeModel();
    myKia.MakeModel();
    myNissan.MakeModel();
    myChevy.MakeModel();
    myHyundia.MakeModel();
    myHonda.MakeModel();

    return 0;
}