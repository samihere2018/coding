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

    int ages[8] = {20, 22, 18, 35, 48, 26, 87, 70};
    int lengthAges = sizeof(ages)/sizeof(ages[0]);

    /*average of different ages*/
    float agesAvg; 
    float agesSum = 0.0;

    for (int i=0; i<sizeof(ages)/sizeof(ages[0]); i++){
        agesSum  = agesSum + ages[i];
    }
    agesAvg = agesSum/lengthAges;
    cout<<"The average age is "<<agesAvg<<".\n";
    cout<<"\n";

    /*find the lowest age*/
    int lowestAge = 500; //abitrary age: there is no 500 year old human on earth

    for (int i=0; i<lengthAges; i++){
        if (ages[i]<lowestAge){
            lowestAge = ages[i];
            i++;
        }
    }
    cout<<"The lowest age is "<<lowestAge<<".\n";
    cout<<"\n";

    /*find the highest age*/
    int highestAge = 0;

    for (int i=0; i<lengthAges; i++){
        if (ages[i]>highestAge){
            highestAge = ages[i];
            i++;
        }
    }
    cout<<"The highest age is "<<highestAge<<".\n";
    cout<<"\n";



    return 0;
}