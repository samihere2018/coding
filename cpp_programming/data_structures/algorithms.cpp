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
#include <algorithm> //include the algorithm library
using namespace std;

int main() {

    /* Sorting Algorithms: To sort elements in a data structure, you can use the sort() function.
                           The sort() function takes iterators (typically a start iterator returned by begin() and 
                           an end iterator returned by end()) as parameters. */

    vector<string> cars = {"Tesla", "Toyota", "BMW", "Cadillac", "Chevrolet", "Honda", "Kia"};

    sort(cars.begin(), cars.end()); //by default, elements are sorted out in alphabetical (ascending) order
    for (string car : cars){
        cout<<car<<endl;
    }
    cout<<" "<<endl;

    /* To reverse the order, you can use rbegin() and rend() instead of begin() and end(). */
    vector<int> numbers = {10, 45, 3, 9, 11, 0, 5, 100, 3023,2024};

    sort(numbers.rbegin(), numbers.rend());//sort numbers numerically in reverse (descending) order
    for(int num : numbers){
        cout<<num<<endl;
    }
    cout<<" "<<endl;

    /* You can also sort specific elements*/
    sort(numbers.begin()+4, numbers.end()); //sort numbers from the 5th element
    for(int num : numbers){
        cout<<num<<endl;
    }
    cout<<" "<<endl;

    /* Searching Algorithms: To search for specific elements in a vector, you can use the find() function.
                             It takes three parameters: start_iterator, end_iterator, value, where value is the value to search for. */
    vector<int> dates = {26, 12, 2, 2024, 2025, 2021, 2018, 2016, 2014, 1989, 1983, 1993};
    auto it = find(dates.begin(), dates.end(), 2024);
    if(it != dates.end()){
        cout<<"The number 2024 was found!\n";
    }
    else{
        cout<<"The number 2024 was not found!\n";
    }

    return 0;
}