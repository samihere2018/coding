/* Date: 10th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures (Vector) */


#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
#include <vector>
using namespace std;

int main() {

    vector<string> USstates = {"Maryland", "Alabama", "Virginia", "Georgia", "Louisiana", "Mississippi", "California", "Texas", "Florida"};
    vector<string> cars = { };
    vector<int> numbers = {1991, 1990, 30, 32, 2018, 2021, 2024, 12, 26, 31};


    /* Check if a Vector is Empty */
    /* Notes: The .empty() function returns 1 (true) if the vector is empty and 0 (false) if it contains one or more elements. */
    cout<<USstates.empty()<<endl; //outputs 0
    cout<<cars.empty()<<endl; //outputs 1

    cout<<" "<<endl;

    /* Loop Through a Vector: You can loop through the vector elements by using a for loop combined with the .size() function. */
    for (int i=0; i<USstates.size();i++){
        cout<<USstates.at(i)<<endl;// or cout<<USstates[i]<<endl;
    }

    cout<<" "<<endl;

    /* You can also use a for-each loop (introduced in C++ version 11 (2011), which is cleaner and more readable. */
    for (int num : numbers){
        cout<<num<<endl;
    }

    return 0;
}

