/*-- Node.cpp------------------------------------------------------------
   This file implements Node member functions.
-------------------------------------------------------------------------*/
#include "Node.h"
#include <cstddef>
#include <iostream>
using namespace std;


Node::Node(int d, Node* n) 
{
	data = d;
	next = n;
}


