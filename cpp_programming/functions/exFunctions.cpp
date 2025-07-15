/* Date: 31st March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Functions : Exercise */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

//function to convert Farenheit to celsius
float celsiusVal(float FarenheitVal){
    float result = (FarenheitVal - 32.0) * (5.0/9.0);
    return result;
}

int main(){

    //Farenheit value
    float FarenVal = 98.8;

    //call function to convert to degree celsius
    float resultVal = celsiusVal(FarenVal);
    cout<<FarenVal<<" Farenheit is "<< resultVal << " in celsius.\n";

    return 0;
}