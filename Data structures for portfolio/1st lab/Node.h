#ifndef NODE
#define NODE
/*-- Node.h ---------------------------------------------------------------

  This header file defines the abstract data type List for processing lists.
  Basic operations are:
	 Constructor
	 empty:    Check if list is empty
	 insert:   Insert an item
	 erase:    Remove an item
	 display:  Output the list
-------------------------------------------------------------------------*/
#include "ElementType.h"
#include <cstddef>
class Node {
public:
	Node(ElementType, Node* n = NULL);
	

	ElementType data;
	Node* next;

};

#endif

