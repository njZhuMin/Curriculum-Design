#ifndef HASHSEARCH_H
#define HASHSEARCH_H
//#include <stdio.h>
#include <cstring>
#include <iostream>
#include <fstream>
#include <iomanip>
#include "GlobalsDefine.h"
using namespace std;

class HashTable  	//Hash表类
{
public:
	char keyword[MAXLEN];
	int count;  	//出现次数（频度）
	int con;  		//冲突次数
};


class HASH
{
public:
	bool ReadSrcFileToHX(const char* filepath);		//读取统计源文件
	void ResetHX();	//读取文件前先清空Hash表
	int CreatHX(char *keyword, int &cmp_count);		//建立Hash表
	int Hash(const char* keyword);			//计算Hash值
	int FindHX(char* keyword, int &cmp_count);		//查找Hash表，分块查找
	int GetFreePos(int key);			//线性探测Hash表空位
	int ShowHashTable(int key);		//显示Hash表
	int isKeyWords(char* word);		//判断是否关键字
	int isLetter(char ch);			//判断是否是字母
private:
	int key;
	char* keyword;
	char* word;
	char ch;
};
#endif // HASHSEARCH_H
