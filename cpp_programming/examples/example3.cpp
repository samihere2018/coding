/* Date: 26th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Example 3 -  total cost of items */

#include <iostream>
#include <string>
#include <cmath>
#include <fstream>
#include <ctime>
using namespace std;

int main() {

    int numberOfItems;
    double unitCost;
    double totalCost;
    char currency = '$';

    cout<<"Enter the total number of items: ";
    cin>>numberOfItems;
    cout<<"Enter the unit cost of the item in USD (example 0.69 or 5.99): ";
    cin>>unitCost;
    totalCost = numberOfItems * unitCost;
    cout<<"The total cost of the items is: "<<currency<<totalCost<<endl;

    return 0;
}