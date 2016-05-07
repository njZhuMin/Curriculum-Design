#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <fstream>
#include "declaration.h"

using namespace std;

class Client//client information
{
public:
	int num;
	char name[10];	
	char password[6];
	char address[20];
	char tel[11];
	
	Client(int n,char *str_name,char *str_password,char *str_address,char *str_tel)
	{
		num=n;
		strcpy(name,str_name);
		strcpy(password,str_password);
		strcpy(address,str_address);
		strcpy(tel,str_tel);
	}
	Client(){}
	
};


class Record//operation record
{
public:
	int record_num;
	char date[8];
	int flag;
	double money;
	char record_name[10];	
	
	Record(int n,char *str_date,int f,double m,char *str_record_name)
	{
		record_num=n;
		strcpy(date,str_date);
		flag=0;
		money=m;
		strcpy(record_name,str_record_name);
	}
	Record(){}
};


class Database
{
private:
	fstream fs;
	string filename;

	void openf()
	{
		fs.open(this->filename.c_str(),fstream::in|fstream::out|fstream::app);
	}

public:
	Database(string fn):filename(fn){	}
	~Database()
	{
		if(fs.is_open())
		fs.close();
	}

//通过id查找位置
size_t query(size_t id)
{
	size_t index=0;
	if(!fs.is_open())
	openf();
	fs.seekg(0,ios_base::beg);
	while(!fs.eof())
	{
		fs.read(reinterpret_cast<char*>(&index),sizeof(int));
		if(index==id)
		{
			fs.seekg(-sizeof(int),ios_base::cur);
			return fs.tellg();
		}
		fs.seekg(sizeof(Client)-sizeof(int),ios_base::cur);
	}
	fs.close();
	return -1;
}


//返回位置n的Client记录
Client retrieve(size_t n)
{
	Client p;
	if(!fs.is_open())
	openf();
	int resultindex=query(n);
	if(resultindex!=-1)//找到了
	{
		fs.seekg(resultindex);
		fs.read(reinterpret_cast<char*>(&p),sizeof(Client));
		fs.close();
		return p;
	}
	fs.close();
}


//修改位置n的Client记录
int update(size_t n, Client& p)
{
	if(!fs.is_open())
	fs.open(filename.c_str(),fstream::in|fstream::out);
	int resultindex=query(n);
	if(resultindex!=-1)//找到了
	{
		fs.seekp(resultindex);
		fs.write(reinterpret_cast<char*>(&p),sizeof(Client));
		fs.close();
	return 0;
	}
	fs.close();
	return 1;
}


//添加一条的记录
void add(Client& p)
{
	if(!fs.is_open())
	openf();
	fs.seekp(0,ios::end);
	fs.write(reinterpret_cast<char*>(&p),sizeof(Client));
	fs.close();
}
};


class Recordbase
{
private:
	fstream fs;
	string filename;
	
	void openf()
	{
		fs.open(this->filename.c_str(),fstream::in|fstream::out|fstream::app);
	}

public:
	Recordbase(string fn):filename(fn){	}
	Recordbase(){}
	~Recordbase()
	{
		if(fs.is_open())
		fs.close();
	}

//通过id查找位置
size_t query(size_t id)
{
	size_t index=0;
	if(!fs.is_open())
	openf();
	fs.seekg(0,ios_base::beg);
	while(!fs.eof())
	{
		fs.read(reinterpret_cast<char*>(&index),sizeof(int));
		if(index==id)
		{
			fs.seekg(-sizeof(int),ios_base::cur);
			return fs.tellg();
		}
		fs.seekg(sizeof(Record)-sizeof(int),ios_base::cur);
	}
	fs.close();
	return -1;
}


//返回位置n的Record记录
Record retrieve(size_t n)
{
	Record p;
	if(!fs.is_open())
	openf();
	int resultindex=query(n);
	if(resultindex!=-1)//找到了
	{
		fs.seekg(resultindex);
		fs.read(reinterpret_cast<char*>(&p),sizeof(Record));
		fs.close();
		return p;
	}
	fs.close();
}


//添加一条的记录
void add(Record& p)
{
	if(!fs.is_open())
	openf();
	fs.seekp(0,ios::end);
	fs.write(reinterpret_cast<char*>(&p),sizeof(Record));
	fs.close();
}
};


//main function
int main()
{
	
	while(1) 
	{
		menu0();
	}
	
	return 0;
}
//end of main function
///////////////////////////////////////


void add_item()
{
	int n,number;
	char str_name[10];
	char str_password[6];
	char str_address[20];
	char str_tel[11];
	cout<<"Please enter your number: \n"<<endl;
	cin>>number;
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
	Database db("db");
	db.add(temp);
	return;
}

void change_item()
{
	int n,number;
	char str_name[10];
	char str_password[6];
	char str_address[20];
	char str_tel[11];
	cout<<"Please enter your number: \n"<<endl;
	cin>>number;
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
	Database db("db");
	db.update(number-1,temp);
	return;
}

void delete_item()
{
	int n=0;
	int number;
	char str_name[10];
	char str_password[6];
	char str_address[20];
	char str_tel[11];
	cout<<"Please enter your number: \n"<<endl;
	cin>>number;
	Client temp(n,str_name,str_password,str_address,str_tel);
	Database db("db");
	db.update(number-1,temp);
}

void display_item()
{
	int i=0;
	Recordbase rb;
	Recordbase p;
	while(1)
	{
		Record rb=p.retrieve(i+1);
		cout<<"Number:"<<rb.record_name<<"\n"<<endl;
		cout<<"Date:"<<rb.date<<"\n"<<endl;
		if (rb.flag=1)
			cout<<"Category:Deposit \n"<<endl;
		else
			cout<<"Category:Withdraw \n"<<endl;
		cout<<"Money: \n"<<rb.money<<endl;
		cout<<"Record_name: \n"<<rb.record_name<<endl;
		i++;
	}
	return;
}

void calculate()
{
	double amount=0;
	Recordbase rb;
	Recordbase p;
	int i=0;
	while(1)
	{
		Record p=rb.retrieve(i+1);
		amount=amount+p.money*p.flag;
		i++;
	}
	cout<<"The deposit of your account is:"<<amount<<endl;
	return;
}

void deposit()
{ 
	int n;
	char c[10];
	char str_date[8];
	int f=1;
	double m;
	char str_record_name[10];
	cout<<"Please enter your number: \n"<<endl;
	cin>>n;
	cout<<"Please enter your profile: \n"<<endl;
	cout<<"Date:"<<endl;
	cin>>str_date;
	cout<<"Money:"<<endl;
	cin>>m;
	cout<<"Your name:"<<endl;
	cin>>str_record_name;
	Record temp(n,str_date,f,m,str_record_name);
	itoa(n,c,10);
	Recordbase rb(c);
	rb.add(temp);
	return;
}

void withdraw()
{
	int n;
	char c[10];
	char str_date[8];
	int f=-1;
	double m;
	char str_record_name[10];
	cout<<"Please enter your number: \n"<<endl;
	cin>>n;
	cout<<"Please enter your profile: \n"<<endl;
	cout<<"Date:"<<endl;
	cin>>str_date;
	cout<<"Money:"<<endl;
	cin>>m;
	cout<<"Your name:"<<endl;
	cin>>str_record_name;
	Record temp(n,str_date,f,m,str_record_name);
	itoa(n,c,10);
	Recordbase rb(c);
	rb.add(temp);
	return;
}
