/* Date: Wednesday, 20th March, 2025 */
/* Author: Sylvia Dogbatsey */
/* Description: Second program in C++ */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
using namespace std;
#include <string>

int main(){

    /*operators: increment, decrement, modulus*/
    int x = 31;
    ++x; /*increment by 1*/
    int y = 4;
    --y; /*decrease by 1*/
    int z = 17%4; /*remainder after division*/

    cout<< x <<"\n";
    cout<< y <<"\n";
    cout<< z <<"\n";
    cout <<"\n";

    /*assignment operators*/
    int w = 5;
    w+=5;
    cout<< w <<"\n";

    int aa = 5;
    aa-=5;
    cout<< aa <<"\n";

    int ab = 5;
    ab/=5;
    cout<< ab <<"\n";

    int ac = 5;
    ac*=5;
    cout<< ac <<"\n";

    int am = 5;
    am%=5;
    cout<< am <<"\n";
    cout <<"\n";

    /*comparison operators*/
    int xx = 31;
    int xy = 30;

    cout << (xx==xy) <<"\n";
    cout << (xx!=xy) <<"\n";
    cout << (xx>xy) <<"\n";
    cout << (xx<xy) <<"\n";
    cout << (xx>=xy) <<"\n";
    cout << (xx<=xy) <<"\n";
    cout <<"\n";

    /*logical operators*/
    int xyz = 10;
    int abc = 2;
    cout << (xyz>3 && abc<20) <<"\n";
    cout << (xyz>3 || abc<20) <<"\n";
    cout << (!(xyz<3 && abc>20)) << "\n";
    
    return 0;
}