/**
 * @warning add "-std=c++11" option to compiler to enable C++ ISO 2011 standard
 */
#include <iostream>
#include <cstring>
#include <ctime>
#include <algorithm>
#include <direct.h>

#include "BasicSort.h"
#include "BiSearch.h"
#include "HashSearch.h"
#include "FileUtils.h"
#include "GlobalsDefine.h"
using namespace std;

//////////////////////////////定义参数//////////////////////////////
time_t t_start[10];
time_t t_end[10];

const char* KeyWords[TOTAL] = 
{
	"auto","double","int","struct","break","else","long","switch",
	"case","enum","register","typedef","char","extern","return","union",
	"const","float","short","unsigned","continue","for","signed","void",
	"default","goto","sizeof","volatile","do","if","while","static",
};
	
/////////////////////////////DECLARATION/////////////////////////////
int get_time(time_t t_start, time_t t_end);
int isKeyWords(char* word);	//判断是否关键字
int isLetter(char ch);		//判断是否是字母


////////////////////////////////MAIN/////////////////////////////////
int main()
{	
//////////////////////////////定义参数//////////////////////////////
	extern int hash_cmp_count;
	extern int bi_cmp_count;
	
////////////////////////////////排序////////////////////////////////
	mkdir("results");
	RanNumToFile("results/Random_Number");		//生成10000个随机数写入文件
	
	int arr[MAXSIZE];
	int len = MAXSIZE;
	cout << "================Loading random numbers from file...================" << endl;
	LoadRanNumFromFile("results/Random_Number",arr);
	cout << "================File load completed!================" << endl << endl;
	
	cout << "================Shell Sort================" << endl;
	t_start[0] = clock();
	ShellSort(arr,len);
	t_end[0] = clock();
	cout << "Time cost: " << get_time(t_start[0],t_end[0]) << " ms" << endl << endl;
	SaveToFile("results/Shell_Sort",arr);
	
	cout << "================Quick Sort================" << endl;
	LoadRanNumFromFile("results/Random_Number",arr);
	t_start[1] = clock();
	QuickSort(arr, 0, len - 1);
	t_end[1] = clock();
	cout << "Time cost: " << get_time(t_start[1],t_end[1]) << " ms" << endl << endl;
	SaveToFile("results/Quick_Sort",arr);
	
	cout << "================Heap Sort================" << endl;
	LoadRanNumFromFile("results/Random_Number",arr);
	t_start[2] = clock();
	HeapSort(arr, len);
	t_end[2] = clock();
	cout << "Time cost: " << get_time(t_start[2],t_end[2]) << " ms" << endl << endl;
	SaveToFile("results/Heap_Sort",arr);
	
	cout << "================Merge Sort================" << endl;
	LoadRanNumFromFile("results/Random_Number",arr);
	t_start[3] = clock();
	MergeSort(arr,len);
	t_end[3] = clock();
	cout << "Time cost: " << get_time(t_start[3],t_end[3]) << " ms" << endl << endl;
	SaveToFile("results/Merge_Sort",arr);

	cout << endl << endl;

////////////////////////////////Hash查找////////////////////////////////
	
	cout << "================Hash Search================" << endl;
	extern HashTable HS[MAXLEN];
	HASH hash;
	//ResetHX(HS);		//清空Hash表
	//ReadSrcFileToHX(path[5]);
	hash.ReadSrcFileToHX("src.cpp");
	cout << endl;
	
	cout << "================Show statistics================" << endl;
	int hash_count = 0;
	for(int i = 0; i < HASHLEN; i++)
	{
		hash_count = hash_count + hash.ShowHashTable(i); 
	}
	cout << "Amount of key words: " << hash_count << endl << endl;	
		
	cout << "================HashKey list for KeyWords================" << endl;
	for(int i = 0; i < TOTAL; i++)
	{
	int has = hash.Hash(KeyWords[i]);
	cout << setiosflags(ios::left) << "[" << setw(2) << has << "]" 
		<< setiosflags(ios::left) << setw(12) << KeyWords[i];
	}
	cout << endl << endl;
 	
	cout << "================Conflicts list================" << endl;
	int conf_count = 0;
	//*conf_count = 0;
	//extern int hash_cmp_count;
	cout << setiosflags(ios::left) << setw(15) << "[Index]" << setiosflags(ios::left) << setw(20)
		<< "[KeyWords]" << setiosflags(ios::left) << setw(20) << "[Conflicts]" << endl;
	for(int i = 0; i < HASHLEN; i++)
	{
		if(strlen(HS[i].keyword) > 0)
		{
			int key = hash.Hash(HS[i].keyword);
			if(key != i)
			{
				conf_count++;
				cout << setiosflags(ios::left) << setw(15) << i << setiosflags(ios::left) << setw(25)	
					<< HS[i].keyword << setiosflags(ios::left) << setw(20) << HS[i].con << endl;
			}
		}
	}
	if(conf_count == 0) 
		cout << "No conflicts!" << endl;
	else
		cout << "Amount of conflict keywords: " << conf_count << endl << endl;	
	
////////////////////////////////二分查找////////////////////////////////	

	/**
	 * @brief must sort the array before using binary search
	 * @warning must declare "using namespace std" \
	 * @warning or use "std::" prefix before sort functions instead
	 */
	//size_t TOTAL = distance(begin(KeyWords), end(KeyWords));
	sort(begin(KeyWords), end(KeyWords), less<string>{});
	
	cout << "================BiSearch================" << endl;
	extern SeqWords SW[TOTAL];
	initKeyWords(SW);
	ReadSrcFileToBi("src.cpp");
	
	ShowKeyWords(SW);
	
	
	cout << "Compare count for Hash Search: " << hash_cmp_count << endl;
	cout << "Compare count for Binary Search: " << bi_cmp_count << endl;
	return 0;

}

///////////////////////////////END MAIN////////////////////////////////

int get_time(time_t t_start, time_t t_end)
{
	return (t_end - t_start) * 1000 / CLOCKS_PER_SEC;
}
