/* Date: 10th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures (List) */
/* Notes: A list is similar to a vector in that it can store multiple elements of the same type and dynamically grow in size.
          However, two major differences between lists and vectors are:
          You can add and remove elements from both the beginning and at the end of a list, 
          while vectors are generally optimized for adding and removing at the end.
          Unlike vectors, a list does not support random access, meaning you cannot directly jump to a specific index, 
          or access elements by index numbers. To use a list, you have to include the <list> header file. */

#include <iostream>
#include <string>
#include <cmath>
#include <ctime>
#include <fstream>
#include <list> //include the list library
using namespace std;

int main() {

    /* To create a list, use the list keyword, and specify the type of values it should store within angle brackets <> and 
    then the name of the list, like: list<type> listName. 
    If you want to add elements at the time of declaration, place them in a comma-separated list, inside curly braces {}. */
    list<string> countries = {"Ghana", "USA", "Canada", "Mexico", "South Africa", "Australia", "England","Nigeria", "Botswana"};
    for(string country : countries){
        cout<<country<<endl;
    }

    cout<<" "<<endl;

    /* Access a List: You cannot access list elements by referring to index numbers, like with arrays and vectors.
                      However, you can access the first or the last element with the .front() and .back() functions, respectively. */
    //access the first element
    cout<<countries.front()<<"\n";

    //access the last element
    cout<<countries.back()<<"\n";

    /* Change a List Element: You can also change the value of the first or the last element with the .front() and .back() functions. */
    
    //change the first element
    countries.front() = "Angola";

    //change the last element
    countries.back() = "Kenya";

    cout<<countries.front()<<endl;
    cout<<countries.back()<<endl;

    cout<<" "<<endl;

    /* Add List Elements: To add elements to a list, you can use .push_front() to insert an element at the beginning
       of the list and .push_back() to add an element at the end. */
    
    //add an element at the beginning
    countries.push_front("Ghana");
    //add an element at the end
    countries.push_back("Bostwana");

    cout<<" "<<endl;

    /* Remove List Elements: To remove elements from a list, use .pop_front() to remove an element from the beginning 
       of the list and .pop_back() to remove an element at the end. */

    //remove an element at the beginning
    countries.pop_front();
    //remove an element at the end
    countries.pop_back();

    /* List Size: To find out how many elements a list has, use the .size() function. */
    cout<<countries.size()<<endl;

    cout<<" "<<endl;
    
    /* Check if a List is Empty: Use the .empty() function to find out if a list is empty or not.
       The .empty() function returns 1 (true) if the list is empty and 0 (false) otherwise. */
    cout<<countries.empty()<<endl;

    cout<<" "<<endl;

    /* Loop Through a List: You cannot loop through the list elements with a traditional for loop combined with the .size() function,
       since it is not possible to access elements in a list by index. */
    for (string country : countries){
        cout<<country<<endl;
    }

    return 0;
}