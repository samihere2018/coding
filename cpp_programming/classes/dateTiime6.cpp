/* Date: 8th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Date (Creating Datetime Structures) */
/* Notes: To display dates from a datetime structure we can use the asctime() function.
          The asctime() function does not correct invalid dates. 
          For example, if you set the day of the month to 32 it will display 32. 
          The mktime() function can correct these kinds of errors: */

#include <iostream>
#include <fstream>
#include <cmath>
#include <string>
#include <ctime>
using namespace std;

int main() {

    //create the datetime structure and use mktime to correct mistakes
    struct tm datetime;
    datetime.tm_year = 2024-1900;
    datetime.tm_mon = 12-1;
    datetime.tm_mday = 26;
    datetime.tm_hour = 0; datetime.tm_min=0; datetime.tm_sec=0;
    datetime.tm_isdst = -1;
    mktime(&datetime);

    cout<<asctime(&datetime)<<endl;

    return 0;
}