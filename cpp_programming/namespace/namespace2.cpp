/* Date: 22nd May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Namespace */
/* Notes: The "using namespace" Keyword: If you don't want to write the namespace name every time you access
                                         the variable, you can use the using keyword.
                                         However, be careful: In large programs, using using namespace can cause name conflicts. 
                                         It's often better to use the full name like MyNamespace::x instead. */

#include <iostream>
#include <cmath>
#include <string>
#include <fstream>
using namespace std;

namespace MyNamespace {
    int x = 45;
}

using namespace MyNamespace;

int main() {
    cout<<x<<endl;
    return 0;
}