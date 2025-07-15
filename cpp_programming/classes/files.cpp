/* Date: 7th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Classes - Files*/
/* Notes: The fstream library allows us to work with files.      
          To use the fstream library, include both the standard <iostream> AND the <fstream> header file

          *** ofstream: Creates and writes to files
          *** ifstream: Reads from files
          *** fstream:  A combination of ofstream and ifstream: creates, reads, and writes to files
          
          To create a file, use either the ofstream or fstream class, and specify the name of the file.
          To write to the file, use the insertion operator (<<). 
          
          To read from a file, use either the ifstream or fstream class, and the name of the file.
          Note that we also use a while loop together with the getline() function (which belongs to the ifstream class) 
          to read the file line by line, and to print the content of the file */

#include <iostream>
#include <cmath>
#include <string>
#include <fstream>
using namespace std;

int main() {

    //create and open a text file
    ofstream MyFile("my1stcppFile.txt");

    //write to the file
    MyFile<<"I am excited to learn how to write programs in C++.\n";

    //close the file
    MyFile.close();

    // Create a text string, which is used to output the text file
    string myText;

    // Read from the text file
    ifstream MyReadFile("my1stcppFile.txt");

    // Use a while loop together with the getline() function to read the file line by line
    while (getline (MyReadFile, myText)){
        // Output the text from the file
        cout<<myText<<endl;
    }

    //close the file
    MyReadFile.close();

    return 0;
}