/* Author:      Sylvia Dogbatsey
   Description: A simple OpenMP program 
   Source:      Wikipedia
   Date:        21st August 2025
   Run:         to run on your terminal you can use; $g++-15  -fopenmp OpenMP_example.cpp -o test 
   Note:        check the version of your gcc from Homebrew using the command ls /opt/homebrew/bin/g++-*  
                and replace 15 with the number you see*/

   #include <iostream>
   #include <omp.h>

   int main(){

    #pragma omp parallel
    printf("Hello, world!\n");

    return 0;
   }

   