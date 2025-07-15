/* Date: 30th April, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Encapsulation*/

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

class phoneNumber{
    private:
      //private attribute
      int cellNum;

    public:
      //setter
      void theNum(int num){
        cellNum = num;
      }

      //getter
      int getNum() {
        return cellNum;
      }
};

int main() {

    phoneNumber myObj;
    myObj.theNum(2018);
    cout<<myObj.getNum()<<endl;
    return 0;
}