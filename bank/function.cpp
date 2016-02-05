#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <fstream>
#include "declaration.h"

using namespace std;

void add_item()
{
	int n;
	char *str_name;
	char *str_password;
	char *str_address;
	char *str_tel;
	cout<<"Please enter your profile: \n"<<endl;
	cout<<"Number:"<<endl;
	cin>>n;
	cout<<"Name:"<<endl;
	cin>>str_name;
	cout<<"Passord:"<<endl;
	cin>>str_password;
	cout<<"Address:"<<endl;
	cin>>str_address;
	cout<<"Tel-number:"<<endl;
	cin>>str_tel;
	Client temp(n,str_name,str_password,str_address,str_tel);
	
}

void change_item();
void delete_item();
void display_item();
void deposite();
void withdraw();