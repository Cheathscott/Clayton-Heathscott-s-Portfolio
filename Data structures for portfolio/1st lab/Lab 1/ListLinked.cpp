/*-- ListLinked.cpp------------------------------------------------------------
   This file implements the ListLinked member functions.
-------------------------------------------------------------------------*/
#include "ListLinked.h"
#include <cstddef>
#include <iostream>
using namespace std;

/* Constructor  */
ListLinked::ListLinked()
{
		top = NULL;
}

/* destructor - clean up memory for remaining nodes in list */
ListLinked::~ListLinked()
{
	Node* temp;
	temp = top;
	while (temp != NULL)
	{
		Node* save = temp;
		temp = temp->next;
		delete save;
	}
}


/* empty */
bool ListLinked::empty()
{
	if (top == NULL)
		return true;
	else
		return false;
}

/* display */
void ListLinked::display()
{
	Node* temp;
	temp = top;
	while (temp != NULL)
	{
		cout << temp->data << ",";
		temp = temp->next;
	}
	cout << endl;
}

/* insert element in position */
void ListLinked::insert(ElementType e, int position = 0)
{
	Node* newptr = new Node(e);
	if (top == NULL) //insert the very first element
		if (position == 0)
		{
			newptr->next = NULL;
			top = newptr;
		}
		else
			cout << "Location Error!!";
	else
		if (position == 0) //insert on the first position when some elements existed
		{
			newptr->next = top;
			top = newptr;
		}
		else //most cases belongs to this situation (as showed in the class slide)
		{
			Node* preptr;
			preptr = top;
			for (int i = 0; i < position - 1; i++)
				preptr = preptr->next;
			newptr->next = preptr->next;
			preptr->next = newptr;
		}
}

/* Remove specified element from the list at a specific position */
void ListLinked::erase(int position)
{
	if (position == 0) //delete the first element
	{
		Node* ptr = top;
		top = ptr->next;
		delete(ptr);
	}
	else
	{
		Node* preptr;
		preptr = top;
		for (int i = 0; i < position - 1; i++)
			preptr = preptr->next;
		Node* ptr = preptr->next;
		preptr->next = ptr->next;
		delete(ptr);
	}
}

