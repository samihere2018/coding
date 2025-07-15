/* Date: 27th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Structures (Notes from W3 schools)*/
/* Structures (also called structs) are a way to group several related variables into one place. 
   Each variable in the structure is known as a member of the structure.
   Unlike an array, a structure can contain many different data types (int, string, bool, etc.)
   To create a structure, use the struct keyword and declare each of its members inside curly braces.
   To access members of a structure, use the dot syntax (.). */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    /* create a structure */    
    struct{ int myNum;
        string myString;
    } myStructure;

    /* define the elements in the structure */
    myStructure.myNum = 1;
    myStructure.myString = "Hello world!";

    /* print out the elements in the structure */
    cout<<myStructure.myNum<<"\n";
    cout<<myStructure.myString<<"\n";
    cout<<"\n";

    /* One Structure in Multiple Variables */
    
    struct{string firstName;
            string lastName;
            int year;
    }myFriend1, myFriend2;

    /* Put data into first structure */
    myFriend1.firstName = "Kefentse";
    myFriend1.lastName = "Malele";
    myFriend1.year = 2019;

    /* Put data into second structure */
    myFriend2.firstName = "Belinda";
    myFriend2.lastName = "Addae";
    myFriend2.year = 1997;

    /* Print out data */
    cout<<myFriend1.firstName<<" "<<myFriend1.lastName<<" and I have been friends since "<<myFriend1.year<<".\n";
    cout<<myFriend2.firstName<<" "<<myFriend2.lastName<<" and I have been friends since "<<myFriend2.year<<".\n";

    return 0;
}