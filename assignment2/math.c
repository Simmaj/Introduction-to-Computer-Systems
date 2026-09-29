#include <stdio.h>

int t, z;

void math() {

   t = ((((z + 1) + 4) << 6) & z) / 8;
   //t = ((((z + 1) + 4) << 6) & z) / 8;
}

int main(void){
    z=100;
    math();
    printf("t = %d\n",t);

    return 0;
}