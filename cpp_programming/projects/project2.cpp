/* Date: 19th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Applications - Project - write a program that:
                                   1. Asks for your name
                                   2. Asks for your age
                                   3. Prints: Hi <name>! You will turn <age+1> next year. */

#include <iostream>
#include <string>
#include <cmath>
#include <ctime>
#include <fstream>
using namespace std;

int main() {
    //enter today's information
    int currentMonth;
    int currentMonthDay;
    cout<<"Enter the current month of the year. Enter 1 for January, 2 for February and so on: ";
    cin>>currentMonth;

    cout<<"Enter the current day of the month of the year. Enter 22 if it's 22nd May: ";
    cin>>currentMonthDay;


    string firstname;
    int brithMonth;
    int birthDayNumber;
    int currentAge;

    cout<<"Enter your first name: ";
    cin>>firstname;

    cout<<"Enter the month your were born. If it's January enter 1, February is 2, March is 3, and so on: ";
    cin>>brithMonth;

    cout<<"Enter the day your were born. Enter 15 if you wer born on 15th April: ";
    cin>>birthDayNumber;

    cout<<"Enter your current age: ";
    cin>>currentAge;

    
    int diffInMonth    = currentMonth - brithMonth; //it's negative if you birth month is before the current month of the year 
    int diffInMonthDay = currentMonthDay - birthDayNumber; //it's negative if you birth month-day is before the current month-day of the year 


    int ageNextYearCelebrated    = currentAge + 1; //if your birthday is already celebrated
    int ageNextYearNotCelebrated = currentAge + 2; //if your birthday is not already celebrated

    //if the user's birth month is before the current month of the year and his birthday is already celebrated
    if (diffInMonth>0){
        cout<<"Hi "<<firstname<<"!. You will turn "<<ageNextYearCelebrated<<" next year.\n";
    }
    //if the user's birth month is the same as the current month of the year and his birthday is already celebrated
    else if(diffInMonth==0 && diffInMonthDay>0){
        cout<<"Hi "<<firstname<<"!. You will turn "<<ageNextYearCelebrated<<" next year.\n";
    }
    //if the user's birth month is the same as the current month of the year but his birthday is not already celebrated
    else if(diffInMonth==0 && diffInMonthDay<0){
        cout<<"Hi "<<firstname<<"!. You will turn "<<ageNextYearNotCelebrated<<" next year.\n";
    }
    //if the user's birth month is the same as the current month of the year but his birthday is not already celebrated
    else if(diffInMonth==0 && diffInMonthDay==0) {
        cout<<"Hi "<<firstname<<"!. You will turn "<<ageNextYearCelebrated<<" next year.\n";
    }
    //if the user's birth month is after the current month of the year
    else if (diffInMonth<0) {
        cout<<"Hi "<<firstname<<"!. You will turn "<<ageNextYearNotCelebrated<<" next year.\n";
    }

    return 0;
}