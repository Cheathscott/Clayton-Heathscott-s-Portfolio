/*-- ListSortedLinked.cpp------------------------------------------------------------
   This file implements the ListSortedLinked member functions.
-------------------------------------------------------------------------*/
#include "ListSortedLinked.h"
#include <cstddef>
#include <iostream>
using namespace std;

/* Constructor  */
ListSortedLinked::ListSortedLinked() 
{
	list = NULL;  // means the list is empty
}

/* destructor - clean up memory for remaining nodes in list */
ListSortedLinked::~ListSortedLinked()
{
	Node* temp;
	temp = list;
	while (temp != NULL)
	{
		Node* save = temp;
		temp = temp->next;
		delete save;
	}
}

/* empty */
/* Big O = ?? */
bool ListSortedLinked::empty()
{
	if (list == NULL)
		return true;
	else
		return false;
}

/* display */  
/* Big O = ?? */
void ListSortedLinked::display()
{
	Node* temp;
	temp = list;  // make temp point to the first node
	while (temp != NULL)
	{
		cout << temp->data << ",";
		temp = temp->next;
	}
	cout << "\n";
}

/* insert element in order */
/* Big O = ?? */
void ListSortedLinked::insert(ElementType e)
{
	Node* newNode = new Node(e);
	if (list == NULL || e < list->data) 
	{
		// either the list is empty
		// OR the new node  should be added before the current first node
		newNode->next = list;
		list = newNode;
	}
	else 
	{
		// find the node that should point to the new node
		// this might be the last node in the list if the
		// new node is bigger than all of the other nodes
		Node* preptr = list;
		while (preptr->next != NULL && preptr->next->data < e) 
		{
			preptr = preptr->next;
		}
		newNode->next = preptr->next;
		preptr->next = newNode;
	}
}

/* Remove specified element from the list */
/* Big O = ?? */
void ListSortedLinked::erase(ElementType e)
{
	if (list != NULL) 
	{
		Node* preptr = list;
		// special case for deleting first node (new beginning of the list)
		if (preptr->data == e)
		{
			list = list->next;
			delete preptr;
		}
		else
		{
			while (preptr->next != NULL && preptr->next->data < e)
			{
				preptr = preptr->next;
			}
			if (preptr->next != NULL && preptr->next->data == e)
			{
				// Save pointer to next for current node
				Node* ptr = preptr->next;
				// Set the next pointer to the next node in list
				preptr->next = ptr->next;
				// Clean up memory
				delete(ptr);
			}
			else
			{
				cout << "Element " << e << " was not found" << endl;
			}
		}
	}
	else
	{
		cout << "List is empty.  Unable to add element " << e << endl;
	}
}

