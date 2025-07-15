/* Date: 25th March, 2025 */
/* Author: Sylvia Dogbatsey */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main(){

    /*jump out of the loop when i is equal to 4*/
    for (int i=0;i<=10;i++){
        if (i==4){
            break;
        }
        cout<<i<<"\n";
    }
    cout<<"\n";

    /*skip the fourth iteration*/
    for (int i=0;i<=10;i++){
        if (i==4){
            continue;
        }
        cout<<i<<"\n";
    }
    cout<<"\n";

    /*break in while loops*/
    int k = 10;
    while(k<100){
        cout<<k<<"\n";
        k+=10;
        if (k==40){
            break;
        }
    }
    cout<<"\n";

    /*continue in while loops*/
    int j = 3;
    while(j<=39){
        if (j==27){
            j+=3;
            continue;
        }
        cout<<j<<"\n";
        j+=3;
    }


    


    return 0;
}