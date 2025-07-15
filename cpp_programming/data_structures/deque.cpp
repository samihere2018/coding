/* Date: 12th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Data Structures (Deque) */
/* Notes: Elements in a queue are added at the end and removed from the front.
          A deque (stands for double-ended queue) however, is more flexible, as elements can be added and 
          removed from both ends (at the front and the back). You can also access elements by index numbers.
          To use a deque, you have to include the <deque> header file. */

#include <iostream>
#include <string>
#include <cmath>
#include <ctime>
#include <fstream>
#include <deque> //deque library
using namespace std;

int main () {

    /* Create a Deque: To create a deque, use the deque keyword, and specify the type of values it should store within 
                       angle brackets <> and then the name of the deque, like: deque<type> dequeName.
                       If you want to add elements at the time of declaration, place them in a comma-separated list, inside curly braces {}. */
    
    deque<string> carModels = {"Tesal Model X", "Chevrolet Cruze", "Nissan Sentra", "Toyota Camry", "Honda Civic", "Hyundia Elantra", "Kia Rio"};
    for (string make : carModels){
        cout<<make<<endl;
    }
    cout<<" "<<endl;

    /* Access a Deque: You can access a deque element by referring to the index number inside square brackets [].
                       Deques are 0-indexed, meaning that [0] is the first element, [1] is the second element, and so on. */

    cout<<"First element in deque: "<<carModels[0]<<endl;
    cout<<"Second element in deque: "<<carModels[1]<<endl;
    cout<<"Last element in deque: "<<carModels[6]<<endl;
    cout<<" "<<endl;


    /*You can also access the first or the last element of a deque with the .front() and .back() functions.*/
    cout<<"Alternate way to access first element in deque: "<<carModels.front()<<endl;
    cout<<"Alternate way to access last element in deque: "<<carModels.back()<<endl;
    cout<<" "<<endl;

    /* To access an element at a specified index, you can use the .at() function and specify the index number.*/
    cout<<"Foruth element in deque: "<<carModels.at(3)<<endl; 
    cout<<" "<<endl;

    /*Change a Deque Element: To change the value of a specific element, you can refer to the index number or use at() */
    carModels[2] = "Audi A3"; //using indexing
    carModels.at(4) = "Ford Mustang";//using at(0 function)
    for (string model : carModels){
        cout<<model<<endl;
    }
    cout<<" "<<endl;

    /* Add Deque Elements: To add elements to a deque, you can use .push_front() to insert an element at the beginning 
                           of the deque and .push_back() to add an element at the end. */
    carModels.front() = "Cardillac CT5";
    carModels.back() = "Mazda CX-70";
    for (string model : carModels){
        cout<<model<<endl;
    }
    cout<<" "<<endl;

    /* Remove Deque Elements: To remove elements from a deque, use .pop_front() to remove an element from the beginning 
                              of the deque and .pop_back() to remove an element at the end. */

    carModels.pop_front();
    carModels.pop_back();
    for(string brand : carModels){
        cout<<brand<<endl;
    }
    cout<<" "<<endl;

    /* Deque Size: To find out how many elements a deque has, use the .size() function. */
    cout<<carModels.size()<<endl;
    cout<<" "<<endl;

    /* Check if a Deque is Empty: Use the .empty() function to find out if a deque is empty or not.
                                 The .empty() function returns 1 (true) if the deque is empty and 0 (false) otherwise. */
    cout<<carModels.empty()<<endl;
    cout<<" "<<endl;

    /* Loop Through a Deque: You can loop through the deque elements by using a for loop combined with the .size() function. */
    for(int i = 0; i<carModels.size(); i++){
        cout<<carModels[i]<<endl;
    }
    cout<<" "<<endl;
    cout<<"Alternatively, you can also use the for-each loop: "<<endl;
    for(string make : carModels){
        cout<<make<<endl;
    }

    return 0;
}