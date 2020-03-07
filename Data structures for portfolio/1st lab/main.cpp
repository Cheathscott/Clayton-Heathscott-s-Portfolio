/*-- main.cpp------------------------------------------------------------
   This file is the driver for testing node and ListSorted
-------------------------------------------------------------------------*/
#include "ListSortedLinked.h"
#include <iostream>
using namespace std;

/* main is the entrypoint into every C++ program */
int main() {


	/* Example of creating nodes for a linked list
	Node* n1 = new Node(5);
	Node* n2 = new Node(15);
	Node* n3 = new Node(25);
	Node* n4 = new Node(55);

	Node* list = n1;
	n1->next = n2;
	n2->next = n3;
	n3->next = n4;
	n4->next = NULL;

	// Print elements in a linked list
	Node* temp;
	temp = list;
	while (temp != NULL)
	{
		cout << temp->data << ",";
		temp = temp->next;
	}
	cout << endl;

	delete n1;
	delete n2;
	delete n3;
	delete n4;*/

	// Examples using ListSorted
	ListSorted* myList = new ListSortedLinked();
	myList->insert(55);
	myList->insert(15);
	myList->insert(75);
	cout << "After inserts" << endl;
	myList->display();

	myList->erase(15);
	cout << "After erase 15" << endl;
	myList->display();
	myList->erase(75);
	cout << "After erase 75" << endl;
	myList->display();
	myList->erase(55);
	cout << "After erase 55" << endl;
	myList->display();

	myList->erase(100);
	delete myList;
	cin.get();
}