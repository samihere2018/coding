/* Date: 8th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Date (Creating Datetime Structures) */
/* Notes: The localtime() and gmtime() functions can convert timestamps into datetime structures.
          The localtime() function returns a pointer to a structure representing the time in the computer's time zone.
          The gmtime() function returns a pointer to a structure representing the time in the GMT time zone.
          These functions return a pointer to a datetime structure. 
          If we want to make sure its value does not change unexpectedly we should make a copy of it by dereferencing the pointer. */

#include <iostream>
#include <cmath>
#include <string>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    time_t timestamp = time(&timestamp);
    struct tm datetime = *localtime(&timestamp);
    struct tm datetime_gm = *gmtime(&timestamp);

    cout<<"The current hour in the USA: " << datetime.tm_hour<< " hours" << endl;
    cout<<"The current hour in the Ghana: " << datetime_gm.tm_hour<< " hours" << endl;
    return 0;
}