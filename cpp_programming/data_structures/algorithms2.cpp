/* Date: 19th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures (Algorithms) */
/* Notes: Algorithms are used to solve problems by sorting, searching, and manipulating data structures.
          The <algorithm> library provides many useful functions to perform these tasks with iterators.
          To use these functions, you must include the <algorithm> header file. */

#include <iostream>
#include <string>
#include <cmath>
#include <ctime>
#include <fstream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {


    /* To search for the first element that is greater than a specific value, you can use the upper_bound() function.
       The upper_bound() function is typically used on sorted data structures. 
       That's why we first sort the vector in the example below. */
    vector<int> dates = {26, 12, 2, 2024, 2025, 2021, 2018, 2016, 2014, 1989, 1983, 1993};
    sort(dates.begin(), dates.end());
    auto it = upper_bound(dates.begin(), dates.end(), 2014); //returns the 1st element that is greater than 2014
    cout<<*it<<endl;
    cout<<" "<<endl;

    /* To find the smallest element in a vector, use the min_element() function. */
    auto it2 = min_element(dates.begin(), dates.end());
    cout<<*it2<<endl;
    cout<<" "<<endl;

    /* To find the largest element, use the max_element() function. */
    auto it3 = max_element(dates.begin(), dates.end());
    cout<< *it3 <<endl;
    cout<<" "<<endl;

    /* Modifying Algorithms: To copy elements from one vector to another, you can use the copy() function. */
    vector<int> copiedNumbers(dates.size());
    copy(dates.begin(), dates.end(), copiedNumbers.begin()); //copies numbers from dates to copiedNumbers

    for (int num : copiedNumbers){
        cout<<num<<endl;
    }
    cout<<" "<<endl;

    /* To fill all elements in a vector with a value, you can use the fill() function. */
    vector<string> cars(3);
    fill(cars.begin(), cars.end(), "Tesla");
    
    for(string car : cars){
        cout<<car<<endl;
    }

    return 0;
}