/* Date: 8th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Date (Creating Datetime Structures) */
/* Notes: The mktime() function also fills in the tm_wday and tm_yday members of the datetime 
          structure with the correct values, which completes the structure and gives a valid datetime.
          It can be used, for example, to find the weekday of a given date. */

#include <iostream>
#include <cmath>
#include <string>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    // Create the datetime structure and use mktime to fill in the missing members
    struct tm datetime;
    datetime.tm_year = 1994-1900;//number of years since 1900
    datetime.tm_mon = 7 - 1; //number of months since January
    datetime.tm_mday = 25; //day of the month
    datetime.tm_hour = 0; datetime.tm_min=0; datetime.tm_sec=0;
    datetime.tm_isdst=-1;
    mktime(&datetime);

    string weekdays[] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

    cout<<"My husband was born on a "<<weekdays[datetime.tm_wday]<<".\n";

    return 0;
}