/* Author: This program computes the value of pi via numerical intergation pi approx f(x) = 4*int_0^1 1/(1+x**2)
   Source: Professor Daniel R. Reynolds' Parallel Computing Lecture 2 Notes
   Date: 24th July 2025 
   Run: to run on your terminal you can use; g++ -o dummyname name_of_file.cpp
                                             ./dummyname value_of_n */

   #include <stdlib.h>
   #include <time.h>
   #include <iostream>
   using namespace std;

   //prototypes
   inline double f(double a){
    return (4.0/(1.0 + a*a));
   }

   int main(int argc, char* argv[]){

    // declarations 
    int i, n;
    double h, x, my_pi = 0.0, err, rtime;
    double pi = 3.14159265358979323846;
    clock_t stime, ftime;

    cout<<"Enter the number of intervals (0 quits):";
    cin>>n;

    if (n<1){
        cout<<"The number of intervals cannot be less than 1.\n";
        return 1;
    }

    //start timer
    stime = clock();

    //set subinterval width
    h = 1.0/n;

    //perform the integration
    for (i=0; i<n; i++){
        x = h * (i + 0.5);
        my_pi += h * f(x);
    }
    err = abs(pi - my_pi);

    //stop timer
    ftime = clock();
    rtime = double (ftime - stime)/CLOCKS_PER_SEC;

    //output the computed value and the true value
    cout<<" computed value = "<<my_pi<<endl;
    cout<<" original vlaue = "<<pi<<endl;
    cout<<" absolute error = "<<err<<endl;
    cout<<" runtime        = "<<rtime<<endl;
    return 0;
   }