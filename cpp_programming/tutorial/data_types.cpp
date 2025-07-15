/* Date: Wednesday, 20th March, 2025 */
/* Author: Sylvia Dogbatsey */
/* Description: Second program in C++ */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
using namespace std;
#include <string> /*To use strings, you must include an additional header file in the source code, the <string> library*/

int main(){

    /*data types: float and double*/
    float f1 = 12e3;
    double f2 = 19e5;
    cout<< f1 << "\n";
    cout<< f2 << "\n";

    /*data types: bool*/
    bool isCodingFun = true;
    bool isCarRacingFun = false;
    cout<< isCodingFun <<"\n";
    cout<< isCarRacingFun <<"\n";

    /*char*/
    char a = 65, b = 66, c = 67, small_a = 97;
    cout<< a <<"\n";
    cout<< b <<"\n";
    cout<< c <<"\n";
    cout<< small_a <<"\n";

    /*string*/
    string greeting = "Good morning, how are you doing today?\n";
    cout<< greeting;

    /*example*/
    int num_of_items = 100;
    float unit_price = 0.59;
    double totalCost = num_of_items * unit_price;
    char currency = '$';
    cout<< "Unit price of item = " <<currency<<unit_price<< "\n"; 
    cout<< "Total number of items = "  <<num_of_items<< "\n"; 
    cout<< "Total cost of items = " <<currency<<totalCost<< "\n";

    return 0;


}