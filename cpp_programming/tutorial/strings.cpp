/* Date: Wednesday, 21st March, 2025 */
/* Author: Sylvia Dogbatsey */
/* Description: Second program in C++ */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
using namespace std;
#include <string> //include the string library

int main (){

    /*string concatenation*/
    string firstname = "Sylvia";
    string lastname = "Dogbatsey\n";
    cout<< firstname + ' ' + lastname;

    string firstname1 = "Sylvia ";
    string lastname1 = "Dogbatsey\n";
    cout<< firstname1 + lastname1;

    /*string concatenation: append function*/
    string firstname2 = "Matthias ";
    string lastname2 = "Dogbatsey\n";
    string fullname2 = firstname2.append(lastname2);
    cout<< fullname2;

    string number1 = "30 ";
    string number2 = "31";
    string bothNumbers = number1 + number2;
    cout<< bothNumbers <<"\n";

    /*string length*/
    string lettersAll = "abcdefghijklmnopqrstuvwxyz";
    cout<< "The length of the string is: " << lettersAll.length() << "\n";
    cout<< "The length of the string is = " << lettersAll.size() << "\n";

    /*access strings*/
    string myString = "SOUTHERN";
    cout<< myString[0] <<"\n"; //first element in string
    cout<< myString[1] <<"\n"; //second element in string
    cout<< myString[10] <<"\n"; //out of range
    cout<< myString[myString.length() - 1] << "\n"; //last element in string

    string myString2 = "METHODIST";
    myString2[myString2.length()-1] = 'K';
    cout<< myString2 <<"\n";
    
    string wordString = "UNIVERISTY";
    cout<< wordString.at(3) <<"\n";

    /*special characters*/
    string statementString = "Alabama football is the \"best\" in the country!\n";
    cout<< statementString;

    string statement2 = "This is the backslash sign: \\ \n";
    cout<< statement2;

    string statement3 = "Hello \tWorld\n";
    cout<< statement3;

    /*user input strings*/
    string FirstName;
    cout<< "Enter your first name: \n";
    cin>> FirstName;
    cout<< "Your first name is " <<FirstName<< ".\n";
    
    return 0;
}