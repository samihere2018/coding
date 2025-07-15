/* Date: 9th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures and Standard Template Library (STL) */
/* Notes: Data structures are used to store and organize data. An array is an example of a data structure, 
          which allows multiple elements to be stored in a single variable. 
          Examples of data structures are: vector, list, stack, queue, deque, set, map.
          Which one to use depends on your specific needs. 
          One thing they all have in common is that you must include the appropriate header file to use them. */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
#include <vector>
using namespace std;

int main() {

  /* a vector called cars, storing string of car brands */
  vector<string> cars = {"Toyota", "Ford", "Chevrolet", "Nissan", "Tesla"};

  /* print out the elements in the vector cars */
  for (string car : cars){
    cout<<car<<"\n";
  }

  return 0;
}