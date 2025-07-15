/* Date: 11th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures (Stack) */
/* Notes: A stack stores multiple elements in a specific order, called LIFO.
          LIFO stands for Last in, First Out. To vizualise LIFO, think of a pile of pancakes, 
          where pancakes are both added and removed from the top. So when removing a pancake, 
          it will always be the last one you added. This way of organizing elements is called LIFO in
          computer science and programming.
          Unlike vectors, elements in the stack are not accessed by index numbers. 
          Since elements are added and removed from the top, you can only access the element at the top of the stack.
          To use a stack, you have to include the <stack> header file. */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
#include <stack>
using namespace std;

int main(){

    /* Create a Stack: To create a stack, use the stack keyword, and specify the type of values it should store within 
                       angle brackets <> and then the name of the stack, like: stack<type> stackName.
                       The type of the stack (string in our example) cannot be changed after its been declared.
                       You cannot add elements to the stack at the time of declaration, like you can with vectors. */
    stack<string> cities;

    /* Add Elements: To add elements to the stack, use the .push() function, after declaring the stack.*/
    cities.push("Birmingham");
    cities.push("Tuscaloosa");
    cities.push("Atlanta");
    cities.push("Starkville");
    cities.push("Dallas");
    cities.push("Fort Worth");
    cities.push("Forney"); //remember that the last element added is the top element

    /* Access Stack Elements: You cannot access stack elements by referring to index numbers, like you would with arrays and vectors.
                              In a stack, you can only access the top element, which is done using the .top() function. */

    cout<<cities.top()<<endl; //outputs Forney

    cout<<" "<<endl;

    /* Change the Top Element: You can also use the .top function to change the value of the top element. */
    cities.top() = "Baltimore"; //replaces Forney with Baltimore 
    cout<<cities.top()<<"\n";   //outputs Baltimore

    cout<<" "<<endl;

    /* Remove Elements: You can use the .pop() function to remove an element from the stack.
                        This will remove the last element that was added to the stack. */
    
    cities.pop(); //Removes Baltimore which was previously Forney
    cout<<cities.top()<<endl; //the top element is now Fort Worth

    cout<<" "<<endl;

    /* Get the Size of the Stack: To find out how many elements a stack has, use the .size() function.*/
    cout<<cities.size()<<endl;

    cout<<" "<<endl;

    /* Check if the Stack is Empty: Use the .empty() function to find out if the stack is empty or not.
                                    The .empty() function returns 1 (true) if the stack is empty and 0 (false) otherwise. */
    
    cout<<cities.empty()<<endl;

    return 0;
}