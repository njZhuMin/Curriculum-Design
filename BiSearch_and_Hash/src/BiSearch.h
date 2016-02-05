#ifndef BISEARCH_H
#define BISEARCH_H
//#include <stdio.h>
#include <iostream>
#include <fstream>
#include <cstring>
#include <iomanip>
#include "GlobalsDefine.h"
using namespace std;

class SeqWords
{
public:
	char keyword[MAXLEN];
	int length;
	int count;
};

int BiSearch(char* des, const char** src, int begin, int last, int &cmp_count);		//非递归二分查找算法
bool ReadSrcFileToBi(const char* filepath);		//读取统计源文件
int isKeyWords(char* word);	//判断是否关键字
int isLetter(char ch);		//判断是否是字母
void initKeyWords(SeqWords* SW);
void countKeyWords(char* word, SeqWords* SW);
void ShowKeyWords(SeqWords* SW);

#endif // BISEARCH_H
