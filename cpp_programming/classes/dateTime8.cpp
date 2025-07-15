/* Date: 8th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Date (Meseauring Time) */
/* Notes:  The clock() function is useful for measuring short intervals of time while the program is running. 
           It is more precise than the difftime() function.
           Each call to the clock function returns a special kind of timestamp measured in clocks (a unit of 
           time that depends on how the library was implemented) which has a data type clock_t. 
           To measure a time difference, store a timestamp at two different moments in time and then subtract them.
            The time difference is measured in clocks, but you can convert it into seconds by 
            dividing it by the CLOCKS_PER_SEC constant. */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    clock_t before = clock();

    int k = 0;
    for (int i=0;i<1000000000;i++){
        k +=i;//k=k+i
    }
    clock_t duration = clock() - before;
    cout<<"It took "<<float(duration)/CLOCKS_PER_SEC<< " seconds for the program to run.\n";

    return 0;
}