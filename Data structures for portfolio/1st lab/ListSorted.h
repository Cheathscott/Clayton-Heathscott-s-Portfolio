#ifndef LISTSORTED
#define LISTSORTED
/*-- ListSorted.h ---------------------------------------------------------------

  This header file defines the abstract data type List (Sorted) for processing 
  lists.
  Basic operations are:
	 Constructor
	 empty:    Check if list is empty
	 insert:   Insert an item
	 erase:    Remove an item
	 display:  Output the list
-------------------------------------------------------------------------*/
#include "ElementType.h"
class ListSorted
{
public:
	virtual ~ListSorted() = 0;
	virtual bool empty() = 0;
	virtual void insert(ElementType item) = 0;
	virtual void erase(ElementType item) = 0;
	virtual void display() = 0;
};

#endif
