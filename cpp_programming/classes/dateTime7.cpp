/* Date: 8th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Date (Meseauring Time) */
/* Notes:  There are two different functions that can be used to measure differences in time.
           The difftime() function measures the number of seconds that passed between two different time stamps. 
           This is useful when measuring time differences between dates.*/

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    time_t now;
    time_t nextyear;
    struct tm datetime;

    now = time(NULL);
    datetime = *localtime(&now);
    datetime.tm_year = datetime.tm_year + 1;
    datetime.tm_mon = 0;
    datetime.tm_mday = 1;
    datetime.tm_hour = 0; datetime.tm_mon=0; datetime.tm_sec=0;
    datetime.tm_isdst = -1;
    nextyear = mktime(&datetime);

    int diff = difftime(nextyear, now);

    cout<<diff<<" seconds until next year"<<endl;

    return 0;
}