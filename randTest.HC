//#include "anotherFile.HC"

U0 Name(){
    Print("hi there I'm a test Holy C file\n");
    "howdy again\n";
}
I32 Add(I32 A, I32 B){
    I32 C = A + B;
    "%d + %d = %d \n", A, B, C;
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
/*
I0 Set(DummyInfo* info){
    info->filename = "randTest.HC";
    info->length = 37;
    info->active = TRUE;
}
*/
I32 main(){
    Name();
    Add(3, 5);
    GT(5,3);
    Print("yo yo yo\n");
    //DummyInfo info;
    //Set(&info);
    //"%s", info.filename;
    //PrintHi();
    return 0;
}