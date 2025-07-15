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
#include <vector>
using namespace std;

int main() {

    //create a vector whose elements are car brands
    vector<string> cars = {"Cadillac", "BMW", "Toyota", "Chevrolet", "Nissan", "Hyundia", "Kia", "Tesla", "Mazda"};

    //create an iterator called it
    vector<string>::iterator it;

    //points the first element in the vector, cars
    it = cars.begin();
    //returns the first element in cars
    cout<<"First Element: "<<*it<<endl;
    cout<<" "<<endl;

    //points to the second element in the cars
    it = cars.begin() + 1;
    //returns the second element in cars
    cout<<"Second Element: "<<*it<<endl;
    cout<<" "<<endl;

    //points to the third element in the cars
    it = cars.begin() + 2;
    //returns the second element in cars
    cout<<"Third Element: "<<*it<<endl;
    cout<<" "<<endl;

    //points to the last element in the cars
    it = cars.end() - 1;
    //returns the second element in cars
    cout<<"Last Element: "<<*it<<endl;
    cout<<" "<<endl;

    /* Notes: Iterators are like "pointers" in that they "point" to elements in a data structure 
              rather than returning values from them. They refer to a specific position, providing 
              a way to access and modify the value when needed, without making a copy of it. */

    //points to the first element in cars
    it  = cars.begin();
    cout<<"First Element: "<<*it<<endl;
    //change the first element from Cadillac to Audi
    *it  = "Audi";
    cout<<"First Element changed to : "<<*it<<endl;
    cout<<" "<<endl;

    //points to the fourth element in cars
    it  = cars.begin() + 4;
    cout<<"Fourth Element: "<<*it<<endl;
    //change the fourth element from Chevrolet to Honda
    *it  = "Honda";
    cout<<"Fourth Element changed to : "<<*it<<endl;
    cout<<" "<<endl;

    //looping through a vector using na integrator

    for (it=cars.begin(); it!=cars.end(); ++it){
        cout<<*it<<endl;
    }

    return 0;
}

