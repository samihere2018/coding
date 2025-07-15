/* Date: 19th May, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

/* Topic: Applications - Project - Calculate a Students Average for Precalculus Algebra and Trigonometry */

#include <iostream>
#include <string>
#include <cmath>
#include <ctime>
#include <fstream>
using namespace std;

//a function that determines the letter grade
string letterGrade (double avgGrade){
    if (avgGrade>=90){
        return "A";
    }
    else if (avgGrade>=80){
        return "B";
    }
    else if (avgGrade>=70){
        return "C";
    }
    else {
        return "No credit for this class. You need to retake the class!\n";
    }
}

int main(){
    int count;

    cout<<"Enter the your number of tests scores (1 to 5)\n";
    cin>>count;

    if (count<1 || count>5){
        cout<<"You should enter the number of tests you took during the class.\n";
        return 1; //exit
    }

    int sum = 0; //sums all the scores entered
    int grade; //this is the actual score
    for (int i = 1; i<=count; i++){
        cout<<"Enter score "<<i<<":";
        cin>>grade;
        sum = sum +  grade;
    }

    double avgGrade = sum / count;

    cout<<"Your average score was "<<avgGrade<<"!\n";

    cout<<"Letter Grade: "<<letterGrade(avgGrade)<<endl;

    return 0;
}
