/* Date: 24th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    /*while loop*/
    int numberI = 0;
    while (numberI<5){
        cout<< numberI <<"\n";
        numberI++;
    }
    cout<< "\n";

    /* do/while loop */
    int i = 5;
    do{
        cout<< i <<"\n";
        i++;
    }
    while(i<10);
    cout<< "\n";

    /*example*/
    int countdown = 3;
    while(countdown>0){
        cout<< countdown <<"\n";
        countdown--;
    }
    cout<< "Happy New Year!\n";
    cout<< "\n";

    /*example*/
    int evenNumber = 0;
    while (evenNumber<12){
        cout<< evenNumber <<"\n";
        evenNumber = evenNumber +  2; //alternatively: evenNumber +=2
    }
    cout<< "\n";

    /*example*/
    //A variable with some specific numbers
    int Numbers = 12345;

    //A variable to store reversed number
    int revNumbers = 0;

    //Reverse and reorder the numbers
    while(Numbers){
        //Get the last number of 'Numbers' and add it to 'revNumbers'
        revNumbers =  revNumbers * 10  + Numbers % 10;
        //Remove the last number of 'Numbers'
        Numbers /= 10;
    }
    cout<< "Reversed numbers: " << revNumbers <<"\n";
    cout<< "\n";

    /*example*/
    int dice = 1;
    while (dice<=6){
        if (dice<6){
            cout<< "No Yatzy!\n";
        }
        else{
            cout<< "Yatzy!\n";
        }
        dice = dice + 1;
    }

    return 0;
}