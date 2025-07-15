/* Date: 25th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    /*loop through an array*/
    string schools[5] = {"UMBC", "SMU", "UA", "UBC", "UG"};
    for (int i=0;i<5;i++){
        cout<<schools[i]<<"\n";
    }
    cout<<"\n";

    for(string school: schools){
        cout<<"school name : "<<school<<"\n";
    }
    cout<<"\n";

    int numbers[4] = {20, 40, 60, 80};
    for (int i=0; i<4; i++){
        cout<<"iter"<<i<<"="<<numbers[i]<<"\n";
    }
    cout<<"\n";

    /*Omit Elements on Declaration*/
    string churches[5];
    churches[0] = "Trinity Church Dallas";
    churches[1] = "Daystar Family Church";
    churches[2] = "Church of Pentecost";
    churches[3] = "Grace Home Chapel";
    churches[4] = "Lighthouse Chapel International";
    cout<<churches[3]<<"\n";

    return 0;
}