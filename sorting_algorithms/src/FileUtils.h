#ifndef FILEUTILS_H
#define FILEUTILS_H
//#include <stdio.h>
#include <iostream>
#include <fstream>
#include <cstring>
#include <ctime>
#include <cstdlib>
#include <iomanip>

using namespace std;

void RanNumToFile(const char* path);		//生成10000个随机数写入文件
void LoadRanNumFromFile(const char* path, int* arr);		//从文件载入随机数
void SaveToFile(const char* path, int* arr);				//将排序数组写入文件

#endif // FILEUTILS_H
