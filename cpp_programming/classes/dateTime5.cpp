/* Date: 8th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Date (Creating Datetime Structures) */
/* Notes: To display dates from a datetime structure we can use the asctime() function.
          The asctime() function does not correct invalid dates. 
          For example, if you set the day of the month to 32 it will display 32. 
          The mktime() function can correct these kinds of errors.
          The ctime() and asctime() functions allow us to display the date but they 
          do not allow us to choose how it is displayed.
          To choose how a date is displayed we can use the strftime() function.

          The strftime() function formats a date and writes it as a C-style string into a char array. 
          It has four parameters:
          The first parameter points to the char array where the formatted date will be written.
          The second parameter specifies the space available in the array.
          The third parameter allows us to choose how the date is formatted using format specifiers.
          The last parameter is a pointer to the datetime structure which contains the date we want to display. */

#include <iostream>
#include <cmath>
#include <string>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    time_t timestamp = time(NULL);
    struct tm datetime = *localtime(&timestamp);
    struct tm datetime_gm = *gmtime(&timestamp);

    cout<<asctime(&datetime);
    cout<<asctime(&datetime_gm);

    char output[50];

    strftime(output, 50, "%B %e, %Y", &datetime);
    cout<<output<<"\n";

    strftime(output, 50, "%I: %M: %S %p", &datetime);
    cout<<output<<"\n";

    strftime(output, 50, "%m %d %y", &datetime);
    cout<<output<<"\n";

    strftime(output, 50, "%a %b %e %H:%M:%S %Y", &datetime);
    cout<<output<<"\n";


    

    return 0;
}