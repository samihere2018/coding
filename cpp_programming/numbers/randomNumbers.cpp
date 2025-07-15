/* Date: 24th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Random Numbers */
/* Notes: You can use the rand() function, found in the <cstdlib> library, to generate a random number. */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
#include <cstdlib>
using namespace std;

int main() {
    cout<<rand()<<endl;
    cout<<" "<<endl;

    /* Notes: To get more control over the random number, for example, if you only want a 
              random number between 0 and 100, you can use the following formula.
              Generate a random number between 0 and 100. */
    int randomNum = rand() % 101;
    cout<<randomNum<<endl;
    cout<<" "<<endl;

    /* Notes: To generate different random numbers each time the program runs, you can use the srand() function 
              and add the time() function from the <ctime> library. */
    srand(time(0));
    int randomNum1 = rand() % 101;
    cout<<randomNum1<<endl;
    
    return 0;
}