/* Date: 26th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){
    /*multidimensional arrays*/
    string letters[2][4] = {
        {"A", "B", "C", "D"},
        {"W", "X", "Y", "Z"}
    };
    cout<<letters[0][2]<<"\n";//returns 3rd element in 1st row (1st row 3rd column)
    cout<<"\n";

    /*change an element in a multidimensional array*/
    letters[1][1] = "U";
    cout<<letters[1][1]<<"\n";
    cout<<"\n";

    /*loop through a multidimensional array*/
    for (int i=0;i<2;i++){
        for (int j=0; j<4; j++){
            cout<<letters[i][j]<<"\n";
        }
    }
    cout<<"\n";

    /*three dimensional array*/
    string myLetters[2][2][2] = {
        {
            {"S","M"},
            {"Y", "H"}
        },
        {
            {"L","T"},
            {"I", "A"}
        }
    };

    for (int i=0;i<2;i++){
        for (int j=0;j<2;j++){
            for(int k=0;k<2;k++){
                cout<<myLetters[i][j][k]<<"\n";
            }
        }
    }

    return 0;
}