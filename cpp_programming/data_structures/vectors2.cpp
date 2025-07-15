/* Date: 9th May, 2025 */
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

    vector<int> numbers = {1991, 1990, 30, 32, 2018, 2021, 2024, 12, 26, 31};

    /* Change a Vector Element */
    numbers[0]    = 1993; //outputs 1993 instead of 1991
    numbers.at(1) = 1994; //outputs 1994 instead of 1990

    cout<<numbers[0]<<endl;
    cout<<numbers[1]<<endl;

    /* Add Vector Elements: The biggest difference between a vector and an array is that vectors can grow dynamically. 
                            That means you can add or remove elements from the vector.
                            To add an element to the vector, you can use the .push_back() function, which will add an 
                            element at the end of the vector. 
                            You can add as many elements as you want. */
    numbers.push_back(17);
    numbers.push_back(1);
    numbers.push_back(3);

    cout<<"Adding elements: "<<endl;
    for(int num : numbers){
        cout<<num<<endl;
    }

    /* Remove Vector Elements: To remove an element from the vector, you can use the .pop_back() function, 
                               which removes an element from the end of the vector */
    numbers.pop_back();

    cout<<"Removing elements"<<endl;
    for(int num : numbers){
        cout<<num<<endl;
    }

    /* Vector Size: To find out how many elements a vector has, use the .size() function. */
    cout<<"There are "<<numbers.size()<<" elements in the vector, numbers."<<endl;

    return 0;
}