#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <fstream>
#include "declaration.h"

using namespace std;

void menu0()
{
	char c;
	while(1)
	{
		system("cls");	
		cout<<"\t\t Welcome to Bank Account System! \n"<<"1.Account management \n"<<"2.Deposit or Withdraw \n"<<"0.Exit \n"<<endl;
		cout<<"Please enter your choice:"<<endl;
		c=getchar();
		getchar();
		switch(c)
		{
			case '1':menu1();break;
			case '2':menu2();break;
			case '0':exit(0);
			default:cout<<"Invalid command! Please retype one."<<endl;
		}
	}
}

void menu1()
{
	char c1;
	system("cls");	
	cout<<"\t\t Welcome to Bank Account System! \n"<<endl;
	cout<<"1.Add an account \n"<<"2.Change an account \n"<<"3.Delete an accoount \n"<<"0.Back \n"<<endl;
	cout<<"Please enter your choice:"<<endl;
	c1=getchar();
	getchar();
	switch(c1)
	{
		case '1':add_item();break;
		case '2':change_item();break;
		case '3':delete_item();break;
		case '4':return;
		default:cout<<"Error command! \n"<<endl;
	}
	return;
}

void menu2()
{
	char c2;
	system("cls");	
	cout<<"\t\t Welcome to Bank Account System! \n"<<endl;
	cout<<"1.Display your account \n"<<"2.Deposit \n"<<"3.Withdraw \n"<<"0.Back \n"<<endl;
	cout<<"Please enter your choice:"<<endl;
	c2=getchar();
	getchar();
	switch(c2)
	{
		case '1':display_item();break;
		case '2':deposit();break;
		case '3':withdraw();break;
		case '0':return;
		default:cout<<"Error command! \n"<<endl;
	}
	return;
}	