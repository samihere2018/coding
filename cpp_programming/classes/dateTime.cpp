/* Date: 8th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Date */
/* Notes: The <ctime> library allows us to work with dates and times.
          To use it, you must import the <ctime> header file.
          The <ctime> library has a variety of functions to measure dates and times.
          The time() function gives us a timestamp representing the current date and time.
          We can use the ctime() function to show the date and time that a timestamp represents.
          */

#include <iostream>
#include <cmath>
#include <string>
#include <fstream>
# include <ctime>
using namespace std;

int main() {

    //get the timestamp for the current date and time
    time_t timestamp;
    time(&timestamp);

    /* Alternative: The time() function writes a timestamp to the memory location given by the parameter, 
       but it also returns the timestamp's value. An alternative way to use the time() function is to 
       pass in a NULL pointer and use the return value instead. */
    // time_t timestamp = time(NULL);

    //display the current date and time represented by the timestamp
    cout<<ctime(&timestamp)<<endl;
    
    return 0;
}