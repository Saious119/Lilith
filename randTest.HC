U0 Name(){
    fprintf(stderr, "hi there I'm a test Holy C file\n");
    "howdy again\n"
}
I32 add(I32 A, I32 B){
    I32 C = A + B;
    "%d + %d = %d \n", A, B, C
    return C;
}
Bool GT(I32 A, I32 B){
    if(A > B){
        fprintf(stderr, "%d > %d \n", A, B);
        return A;
    }
    else {
        return B;
    }
}

I32 main(){
    Name();
    add(3, 5);
    GT(5,3);
    Print("yo yo yo\n");
    return 0;
}