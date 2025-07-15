/* Date: 15th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures (Integrators) */
/* Notes: Iterators are used to access and iterate through elements of 
          data structures (vectors, sets, etc.), by "pointing" to them.
          It is called an "iterator" because "iterating" is the technical term for looping. 
          1. begin() and end() are functions that belong to data structures, such as vectors and lists. 
             They do not belong to the iterator itself. Instead, they are used with iterators to access 
             and iterate through the elements of these data structures.
          2. begin() returns an iterator that points to the first element of the data structure.
          3. end() returns an iterator that points to one position after the last element meaning it doesn't point to an actual
             element, but rather indicates that this is the end of the vector). */

#include <iostream>
#include <string>
#include <cmath>
#include <ctime>
#include <fstream>
#include <vector> //vector library
#include <list>   //list library
#include <deque>  //deque library
#include <set>    //set library
#include <map>    //map library
using namespace std;

int main() {

    //create a vector whose elements are car brands
    vector<string> cars = {"Cadillac", "Toyota", "Chevrolet", "Nissan", "Hyundia", "Tesla", "Mazda"};

    /* Notes: The auto Keyword: In C++ 11 and later versions, you can use the auto keyword instead of explicitly 
              declaring and specifying the type of the iterator.
              The auto keyword allows the compiler to automatically determine the correct data type, 
              which simplifies the code and makes it more readable. */

    //instead of vector<string>:: iterator it = cars.begin(), we do
    auto it = cars.begin();
    cout<<*it<<endl;
    cout<<" "<<endl;

    //looping through a vecor using an intergator
    //In the example above, the compiler knows the type of it based on the return type of cars.begin(), which is vector<string>::iterator.
    for(it=cars.begin(); it!=cars.end(); it++){
        cout<<*it<<endl;
    }
    cout<<" "<<endl;

    //You can use a for-each loop to just loop through elements of a data structure, like this:
    for (string car: cars){
        cout<<car<<endl;
    }
    cout<<" "<<endl;

    /* When you are just reading the elements, and don't need to modify them, the for-each loop
      is much simpler and cleaner than iterators. However, when you need to add, modify, or remove elements during iteration, 
      iterate in reverse, or skip elements, you should use iterators. */

    for (it=cars.begin(); it!=cars.end();){
        if(*it=="Toyota"){
            it = cars.erase(it); //remove the element Toyota
        }
        else{
            ++it;
        }
    }

    //print the elements in cars
    for(const string& car: cars){
        cout<<car<<endl;
    }
    cout<<" "<<endl;

    //Iterate in Reverse: To iterate in reverse order, you can use rbegin() and rend() instead of begin() and end()
    for(auto it = cars.rbegin(); it != cars.rend(); ++it){
        cout<<*it<<endl;
    }
    cout<< " "<<endl;

    //Iterate Through other Data Structures: Iterators are great for code reusability since you can use the same syntax for iterating through vectors, lists, deques, sets and maps.

    list<string> states = {"Texas", "Alabama", "North Dakota", "Tennesse", "California", "Florida", "Maryland"};
    for (auto it=states.begin(); it!=states.end(); ++it){
        cout<<*it<<endl;
    }
    cout<< " "<<endl;

    deque<int> numbers = {1991, 20, 40, 45, 311, 32, 0, 4, 2004, 20389};
    for (auto it=numbers.rbegin(); it!=numbers.rend();++it){
        cout<<*it<<endl;
    }
    cout<< " "<<endl;

    set<string> schools = {"KNUST", "UA", "UA", "SMU", "UMBC", "Central", "UCC"};
    for (auto it=schools.begin(); it!=schools.end();++it){
        cout<<*it<<endl;
    }
    cout<< " "<<endl;

    map<string, int> nameAge = {{"Kofi", 20}, {"Kwame", 56}, {"Ama", 80}, {"Adwoa", 100}, {"Kwadwo", 100}, {"Kwabena", 45}};
    for (auto it=nameAge.begin(); it != nameAge.end(); ++it){
        cout<<it->first<<" is "<<it->second<<" years old.\n";
    }

    return 0;
}

