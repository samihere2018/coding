/* Date: 13th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures (Sets) */
/* Notes: A set stores unique elements where they:
          1. Are sorted automatically in ascending order.
          2. Are unique, meaning equal or duplicate values are ignored.
          3. Can be added or removed, but the value of an existing element cannot be changed.
          4. Cannot be accessed by index numbers, because the order is based on sorting and not indexing.
          To use a set, you have to include the <set> header file. */

#include <iostream>
#include <cmath>
#include <string>
#include <ctime>
#include <fstream>
#include <set> //the set library
using namespace std;

int main() {

    /* Create a Set: To create a set, use the set keyword, and specify the type of values it should 
                     store within angle brackets <> and then the name of the set, like: set<type> setName. 
                     If you want to add elements at the time of declaration, place them in a comma-separated list, 
                     inside curly braces {}. */

    set<string> continents = {"Africa", "North America", "South America", "Australia", "Asia", "Europe"};

    //print out the elements in the set. the elements will be printed out in ascending order (alphabetical order in this case)
    for (string continent : continents){
        cout<<continent<<endl;
    }
    cout<<" "<<endl;

    set<int> numbers = {1993, 1994, 26, 12, 31, 2021, 2024, 2014, 2012, 2016, 17};
    for (int num : numbers){
        cout<<num<<endl;
    }
    cout<<" "<<endl;

    /*Sort a Set in Descending Order: By default, the elements in a set are sorted in ascending order. 
                                      If you want to reverse the order, you can use the greater<type> functor inside the angle brackets. */

    set<int, greater<int>> years = {2021, 2023, 1993, 1994, 2024, 2014, 2012, 2016, };
    for (int num : years){
        cout<<num<<endl;
    }
    cout<<" "<<endl;

    /* Unique Elements: Elements in a set are unique, which means they cannot be duplicated or equal.
                        For example, the duplicate elements "Tesla" nad "Toyota" are ignored. */

    set<string> cars = {"Tesla", "BMW", "Mazda", "Toyota", "Chevrolet", "Nissan", "Tesla", "Honda", "Kia", "Toyota"};
    for (string car : cars){
        cout<<car<<endl;
    }
    cout<<" "<<endl;

    /* Add Elements: To add elements to a set, you can use the .insert() function. */
    cars.insert("Audi");
    cars.insert("Cadillac");
    cars.insert("Ford");
    for (string car : cars){
        cout<<car<<endl;
    }
    cout<<" "<<endl;

    /* Remove Elements: To remove specific elements from a set, you can use the .erase() function. 
                        Remvoing a duplicate item removes it entirely from the set. */
    cars.erase("Cadillac");
    for (string car : cars){
        cout<<car<<endl;
    }
    cout<<" "<<endl;

    // /* To remove all elements from a set, you can use the .clear() function. */
    // cars.clear(); 
    // for (string car : cars){
    //     cout<<car<<endl;
    // }
    // cout<<" "<<endl;

    /* Find the Size of a Set: To find out how many elements a set has, use the .size() function.*/
    cout<<cars.size()<<"\n";
    cout<<" "<<"\n";

    /* Check if a Set is Empty: Use the .empty() function to find out if a set is empty or not.
                                The .empty() function returns 1 (true) if the set is empty and 0 (false) otherwise. */
    cout<<numbers.empty()<<endl;
    cout<<" "<<endl;

    /*Loop Through a Set: You can loop through a set with the for-each loop. */
    set<string> schools = {"UMBC", "UG", "UCC", "Central Uni", "KNUST", "UA", "SMU"};
    for (string school : schools){
        cout<<school<<endl;
    }

    return 0;
}