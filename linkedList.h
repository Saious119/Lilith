#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

struct Node {
    char* value;
    struct Node* next;
    struct Node* prev;
};

/*struct Node first;
struct Node* head = &first;
head->next=NULL;
head->prev=NULL;
*/
struct Node* head = NULL;
struct Node* current = NULL;

int len(){
    int len=0;
    struct Node *current;
    for(current = head; current != NULL; current = current->next){
        len++;
    }
    return len;
}

struct Node* FindLastNode(){
    struct Node* curr_pointer = head;
    if(curr_pointer == NULL){ //if this is the first item
        return curr_pointer;
    }
    while(curr_pointer->next != NULL){
        curr_pointer = curr_pointer->next;
    }
    return curr_pointer;
}

bool isEmpty(){
    return head == NULL;
}

void insert(char* val){
    struct Node* Last = FindLastNode();
    struct Node* NewNode = (struct Node*) malloc(sizeof(struct Node));
    if(Last == NULL){ //if the list is empty
        NewNode->value = val;
        NewNode->next = Last;
        head = NewNode;
    }
    else{
        NewNode->value = val;
        NewNode->next = NULL;
        NewNode->prev = Last;
        Last->next = NewNode;
    }
} 

void deleteNode(char* val){
    struct Node* current;

    if(head == NULL){
        return;
    }
    for(current = head; current != NULL; current = current->next){
        if(current->value == val){
            if(current != head){
                current->prev->next = current->next;
                current->next->prev = current->prev;
            }
            else{
                current->next->prev = NULL;
                head = current->next;
            }
            free(current);
        }
        else if(current->next == NULL){
            return;
        }
    }
}

struct Node* find(char* val){
    struct Node* current;
    for(current = head; current != NULL; current = current->next){
        if(current->value == val){
            return current;
        }
    }
    return NULL;
}

void printList(){
    fprintf(stderr, "\n[");
    for(current = head; current != NULL; current = current->next){
        fprintf(stderr, " %s ", current->value);
    }
    fprintf(stderr, "]\n");
}