/* Date: 12th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures (Queues) */
/* Notes: A queue stores multiple elements in a specific order, called FIFO.
          FIFO stands for First in, First Out. To visualize FIFO, think of a queue as people standing in line in a supermarket. 
          The first person to stand in line is also the first who can pay and leave the supermarket. 
          This way of organizing elements is called FIFO in computer science and programming.
          Unlike vectors, elements in the queue are not accessed by index numbers.
          Since queue elements are added at the end and removed from the front, you can only access an element at the front or the back.
          To use a queue, you have to include the <queue> header file. */

#include <iostream>
#include <string>
#include <cmath>
#include <ctime>
#include <fstream>
#include <queue> //use the queue library
using namespace std;

int main() {

    /* Create a Queue: To create a queue, use the queue keyword, and specify the type of values it should store within 
                       angle brackets <> and then the name of the queue, like: queue<type> queueName.
                       The type of the queue (string in our example) cannot be changed after its been declared.
                       You cannot add elements to the queue at the time of declaration, like you can with vectors. */
    
    queue <int> years;

    /* Add Elements: To add elements to the queue, you can use the .push() function after declaring the queue.
                     The .push() function adds an element at the end of the queue. */

    years.push(1993);  //first element
    years.push(2012);
    years.push(2014);
    years.push(2016);
    years.push(2018);
    years.push(2024);  //last element

    /* Access Queue Elements: You cannot access queue elements by referring to index numbers, like you would with arrays and vectors.
                              In a queue, you can only access the element at the front or the back, using .front() and .back() respectively. */
            
    cout<<years.front()<<endl;
    cout<<years.back()<<endl;
    cout<<" "<<endl;

    /* Change Front and Back Elements: You can also use .front and .back to change the value of the front and back elements. */

    years.front() = 1994;
    years.back() = 2021;
    cout<<years.front()<<endl;
    cout<<years.back()<<endl;
    cout<<" "<<endl;

    /* Remove Elements: You can use the .pop() function to remove an element from the queue.
                        This will remove the front element (the first and oldest element that was added to the queue). */
    years.pop();
    cout<<years.front()<<endl;

    /* Get the Size of a Queue: To find out how many elements there are in a queue, use the .size() function. */
    cout<<years.size()<<endl;
    cout<< " "<<endl;

    /* Check if the Queue is Empty: Use the .empty() function to find out if the queue is empty or not.
                                    The .empty() function returns 1 (true) if the queue is empty and 0 (false) otherwise. */
    cout<<years.empty()<<endl;
    cout<< " "<<endl;

    return 0;
}
