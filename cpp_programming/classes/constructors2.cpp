/* Date: 30th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Constructors*/
/*        A constructor in C++ is a special method that is automatically called when an object of a class is created.
          To create a constructor, use the same name as the class, followed by parentheses () */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

class collegeLoc{
    public:
      string schoolName;
      string schoolState;
      string schoolCity;
      collegeLoc(string x, string y, string z) {
        schoolName = x;
        schoolState = y;
        schoolCity = z;
      }
};

class countryCap{
    public:
      string countryName;
      string capital;
      countryCap(string x, string y);
};

//defining the constructor outside the class
countryCap::countryCap(string x, string y) {
    countryName = x;
    capital = y;
};

int main() {
    collegeLoc myData1("Univerity of Alabama", "Alabama", "Tuscaloosa");
    collegeLoc myData2("Southern Methodist University", "Texas", "Dallas");
    collegeLoc myData3("Univerity of Maryland Baltimore County", "Maryland", "Baltimore");

    cout << myData1.schoolName<<" in "<<myData1.schoolCity<<", "<<myData1.schoolState<<endl;
    cout << myData2.schoolName<<" in "<<myData2.schoolCity<<", "<<myData2.schoolState<<endl;
    cout << myData3.schoolName<<" in "<<myData3.schoolCity<<", "<<myData3.schoolState<<endl;

    cout <<endl;

    countryCap myObj1("Ghana", "Accra");
    countryCap myObj2("USA", "Washington DC");
    countryCap myObj3("Israel", "Tel Aviv");

    cout << "The capital of "<<myObj1.countryName<<" is "<<myObj1.capital<< "."<<endl;
    cout << "The capital of "<<myObj2.countryName<<" is "<<myObj2.capital<< "."<<endl;
    cout << "The capital of "<<myObj3.countryName<<" is "<<myObj3.capital<< "."<<endl;

    return 0;
}