/* Date: Wednesday, 20th March, 2025 */
/* Author: Sylvia Dogbatsey */
/* Description: Second program in C++ */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
using namespace std;

int main(){

    int WeddingYear = 2024;
    cout<< WeddingYear <<"\n";

    int WeddingMonth;
    WeddingMonth = 12;
    cout<< WeddingMonth <<"\n";

    int WeddingDay = 26;
    WeddingDay = 31;
    cout<< WeddingDay <<"\n";

    double BagPackPrice = 39.99;
    char NameLetter = 'S';
    string FirstName = "Sylvia";
    bool GivenInfo = true;
    float Balance = 109.11;

    cout<< BagPackPrice <<"\n";
    cout<< NameLetter <<"\n";
    cout<< FirstName <<"\n";
    cout<< GivenInfo <<"\n";
    cout<< "I got married in " << WeddingYear << ", in Ghana. \n";
    cout<< Balance <<"\n";

    int x = 12;
    int y = 23;
    int sum = x + y;
    cout<< sum <<"\n";

    int xx = 12, yy = 23, zz = 10;
    cout<< xx + yy + zz <<"\n";

    int x1, y1, z1;
    x1 = y1 = z1 = 100;
    cout<< x1 + y1 + z1 <<"\n";

    const int DateToday = 19;
    cout<< DateToday <<"\n";

    /*This will not work*/
    // const int DateToday1;
    // DateToday1 = 19;
    // cout<< DateToday1 <<"\n";

    return 0;
}