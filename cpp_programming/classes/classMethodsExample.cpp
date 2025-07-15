/* Date: 28th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Class Methods (Example)*/

#include <iostream>
#include <cmath>
#include <string>
using namespace std;

class Car {
    public:
      int carSpeed(int maxSpeed);
};

int Car :: carSpeed(int maxSpeed) {
    return maxSpeed;
}

int main() {
    Car mySpeed;
    int result = mySpeed.carSpeed(70);
    cout<<"She was driving at " <<result << " mph.\n";

    /* alternatively */
    cout<<"The man was driving at " <<mySpeed.carSpeed(100) << " mph.\n";
    return 0;
}