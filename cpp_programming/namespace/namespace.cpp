/* Date: 22nd May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Namespace */
/* Notes: A namespace is a way to group related code together under a name. 
          It helps you avoid naming conflicts when your code grows or when you use code from multiple sources.
          Think of a namespace like a folder: you can have a variable named x in two different folders, and they won't clash. 
          Why Use Namespaces?
            1. To avoid name conflicts, especially in larger projects.
            2. To organize code into logical groups.
            3. To separate your code from code in libraries. */

#include <iostream>
#include <cmath>
#include <string>
#include <fstream>
#include <ctime>
using namespace std;

namespace MyNamespace {
  int x = 42;
}

int main() {
  cout << MyNamespace :: x << endl; // use MyNamespace::x to access the variable inside the namespace.
  return 0;

}



