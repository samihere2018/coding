#include <stdio.h>

int main() {
    int myNum = 19;
    myNum = 25; 
    int myOtherNum = 14;
    // myOtherNum = myNum;
    printf("%d\n", myOtherNum); 

    int x = 5;
    int y = 6;
    int sum = x + y;
    printf("%d\n", sum); 


    int xx = 25, yy = 19, zz= 14;
    printf("%d\n", xx + yy + zz); 

    //  ASCII characters are numbers
    char a = 65, b = 66, c = 67;
    printf("%c\n",a);
    printf("%c\n",b);
    printf("%c\n",c);

    // string
    char myText[] = "Hello Sylvia Adowa Nyamekye Amihere!\n";
    printf("%s", myText);

    return 0;
}