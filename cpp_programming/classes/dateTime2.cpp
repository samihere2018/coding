/* Date: 8th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Date (Creating Timestamps) */
/* Notes: The time() function can only create a timestamp for the current date, 
          but we can create a timestamp for any date by using the mktime() function.
          The mktime() function converts a datetime structure into a timestamp. 
          The mktime() function needs these members to have a value: 
          tm_year, tm_mon, tm_mday, tm_hour, tm_min, tm_sec and tm_isdst.*/

#include <iostream>
#include <cmath>
#include <fstream>
#include <string>
#include <ctime>
using namespace std;

int main() {
    struct tm datetime;
    time_t timestamp;

    datetime.tm_year = 1993-1900; //number of year since 1990
    datetime.tm_mon = 4 - 1; //number of months since January (we want April)
    datetime.tm_mday = 19; //day of the month
    datetime.tm_hour = 12; //the hour within the day (from 0 to 23)
    datetime.tm_min = 10; //minutes within an hour
    datetime.tm_sec = 19; //seconds within a minute

    // Daylight Savings must be specified
    // -1 uses the computer's timezone setting
    datetime.tm_isdst = -1;

    timestamp = mktime(&datetime);
    cout<<"I was born on "<<ctime(&timestamp)<<"."<<endl;

    return 0;
}