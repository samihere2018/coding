/* Date: 22nd May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Namespace */
/* Notes: The std Namespace: In C++, things like cout, cin, and endl belong to the Standard Library.
          These are all part of a namespace called std, which stands for standard. 
          That means you normally have to write std::cout, std::cin, and so on.
          To make your code shorter, you can add: using namespace std;
          This lets you use cout, cin, and endl without writing std:: every time.
          This is what we've been doing in our previous codes so in this code we will do an example with using "using namespace std"
          
          For small programs and learning, using namespace std is fine.
          But in large projects, it is better to write std:: before each item. 
          This prevents conflicts if different libraries have functions or variables with the same name.
          In short: using namespace std; is helpful for beginners, but use it with care in big programs. */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>

int main() {

    std::cout<<"Hello, World!"<<std::endl;
    return 0;
}