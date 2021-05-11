#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>
void Name(){
    fprintf(stderr, "hi there I'm a test Holy C file\n");
    printf("howdy again\n");
}
int add(int A, int B){
    int C = A + B;
    printf("%d + %d = %d \n", A, B, C);
    return C;
}
bool GT(int A, int B){
    if(A > B){
        fprintf(stderr, "%d > %d \n", A, B);
        return A;
    }
    else {
        return B;
    }
}

int main(){
    Name();
    add(3, 5);
    GT(5,3);
    printf("yo yo yo\n");
    return 0;
}