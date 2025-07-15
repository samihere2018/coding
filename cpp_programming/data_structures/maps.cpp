/* Date: 13th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures (Maps) */
/* Notes: A map stores elements in "key/value" pairs.
          Elements in a map are:
          Accessible by keys (not index), and each key is unique (A map cannot have elements with equal keys.).
          Values can be equal, but keys must be unique.
          If you try to add a key two times to the map, it will only keep the first one.
          Automatically sorted in ascending order by their keys.
          To use a map, you have to include the <map> header file. */

#include <iostream>
#include <cmath>
#include <string>
#include <ctime>
#include <fstream>
#include <map> //map library
using namespace std;

int main() {

    /* Create a Map: To create a map, use the map keyword, and specify the type of both the key and the value it should store 
                     within angle brackets <>. At last, specify the name of the map, like: map<keytype, valuetype> mapName.
                     If you want to add elements at the time of declaration, place them in a comma-separated list, inside curly braces {}. */
    map<string, string> stateTown = {{"Alabama", "Tuscaloosa"}, {"Texas", "Fort Worth"}, {"California", "San Francisco"}, {"Mississippi", "Starkville"}, {"Florida", "Tallahasse"}, {"Louisiana", "Baton Rouge"}, {"Maryland", "Baltimore"}, {"Virginia","Richmond"}, {"Georgia", "Atlanta"}};

    /* Access a Map: You cannot access map elements by referring to index numbers, like you would with arrays and vectors.
                     Instead, you can access a map element by referring to its key inside square brackets []. */
    cout<<"I visited "<<stateTown["Virginia"]<<", Virginia in 2022.\n";
    cout<<"I visited "<<stateTown["California"]<<", California in 2024.\n";
    cout<<"I visited "<<stateTown["Maryland"]<<", Maryland in 2025.\n";
    cout<< " "<<endl;

    /* You can also access elements with the .at() function. 
       The .at() function is often preferred over square brackets [] because 
       it throws an error message if the element does not exist. */
    cout<<"I visited "<<stateTown. at("Texas")<<", Texas in 2022.\n";
    cout<<"I visited "<<stateTown.at("Louisiana")<<", Louisiana in 2023.\n";
    cout<< " "<<endl;

    /* Change Values: You can also change the value associated with a key.
                      However, it is safer to use the .at() function. */
    stateTown["Texas"] = "Dallas";
    stateTown["Louisiana"] = "Lafayette";
    cout<<stateTown["Louisiana"]<< " is a city in Louisiana.\n";
    cout<<stateTown.at("Texas")<<" is a city in Texas.\n";
    cout<< " "<<endl;

    /* Add Elements: To add elements to a map, it is ok to use square brackets [].
                     But you can also use the .insert() function. */
    stateTown["New York"] = "JFK Airport";
    stateTown.insert({"Washington DC","Washington DC"});
    cout<<stateTown["New York"]<< " is in the city of New York.\n";
    cout<<stateTown["Washington DC"]<< " is the capital town of the USA.\n";
    cout<< " "<<endl;


    /* Loop Through a Map: You can loop through a map with the for-each loop. However, there are a couple of things to be aware of:
                           1. You should use the AUTO keyword (introduced in C++ version 11) inside the for loop. 
                              This allows the compiler to automatically determine the correct data type for each key-value pair.
                           2. Since map elements consist of both keys and values, you have to include .first to access the keys, 
                              and .second to access values in the loop.
                           3. Elements in the map are sorted automatically in ascending order by their keys. */

    for (auto stateT : stateTown){
        cout<<stateT.second<<" is in "<<stateT.first<<".\n";
    }
    cout<< " "<<endl;


    /* Remove Elements: To remove specific elements from a map, you can use the .erase() function. */
    //remive element by key
    stateTown.erase("Washington DC");
    for (auto stateT : stateTown){
        cout<<stateT.second<<" is in "<<stateT.first<<".\n";
    }
    cout<< " "<<endl;

    // /* To remove all elements from a map, you can use the .clear() function. */
    // stateTown.clear();
    // for (auto stateT : stateTown){
    //     cout<<stateT.second<<" is in "<<stateT.first<<".\n";
    // }
    // cout<< " "<<endl;


    /* Find the Size of a Map: To find out how many elements a map has, use the .size() function. */
    cout<<stateTown.size()<<endl;
    cout<< " "<<endl;

    /* Check if a Map is Empty: Use the .empty() function to find out if a map is empty or not.
                                The .empty() function returns 1 (true) if the map is empty and 0 (false) otherwise. */
    cout<<stateTown.empty()<<endl;
    cout<< " "<<endl;

    /* You can also check if a specific element exists, by using the .count(key) function.
       It returns 1 (true) if the element exists and 0 (false) otherwise. */
    cout<<stateTown.count("Texas")<<endl;
    cout<<stateTown.count("Washington DC")<<endl;
    cout<< " "<<endl;

    return 0; 
}