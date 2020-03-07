#ifndef LISTSORTEDLINKED
#define LISTSORTEDLINKED
#include "ListSorted.h"
#include "Node.h"
/*-- ListSorted.h ---------------------------------------------------------------
  This header file defines the data type ListSorted for processing lists.
  This class inherits from the abstract base class List
  Basic operations are:
	 Constructor
	 empty:    Check if list is empty
	 insert:   Insert an item
	 erase:    Remove an item
	 display:  Output the list
-------------------------------------------------------------------------*/
class ListSortedLinked : public ListSorted
{
public:
	/* Constructor for the list */
	ListSortedLinked();

	/* Destructor for the list */
	~ListSortedLinked();

	/* Indicates if the list is empty */
	bool empty();

	/* Display the list to stdout */
	void display();

	/* Insert an item into the list in order */
	void insert(ElementType e);

    /* Remove the item from the list */
	void erase(ElementType e);

private:
	Node* list; // pointer to the first node in the list
};

#endif
