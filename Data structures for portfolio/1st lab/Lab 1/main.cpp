/*-- main.cpp------------------------------------------------------------
   This file is the driver for testing ListLinked
-------------------------------------------------------------------------*/
#include "ListLinked.h"
#include <iostream>
using namespace std;

/* main is the entrypoint into every C++ program */
int main() 
{
	ListLinked* ll = new ListLinked();
	ll->insert(10, 0);
	ll->insert(20, 1);
	ll->insert(30, 2);
	ll->insert(40, 3);
	ll->display();
	ll->insert(50, 0);
	ll->insert(60, 3);
	ll->insert(70, 5);
	ll->display();
	ll->erase(2);
	ll->display();
	ll->erase(1);
	ll->display();
	ll->erase(3);
	ll->display();
	// #3, Add 5 inserts
	// #6, Add 5 erases
	delete ll;

	cin.get();
	return 0;

}