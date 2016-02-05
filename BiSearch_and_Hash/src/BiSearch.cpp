#include "BiSearch.h"
	
	int bi_cmp_count = 0;
	SeqWords SW[TOTAL];

/*
 * 折半查找法：
 * 在有序表中，把待查找数据值与查找范围的中间元素值进行比较，会有三种情况出现：
 * 1.待查找数据值与中间元素值正好相等，则放回中间元素值的索引
 * 2.待查找数据值比中间元素值小，则以整个查找范围的前半部分作为新的查找范围，执行1，直到找到相等的值
 * 3.待查找数据值比中间元素值大，则以整个查找范围的后半部分作为新的查找范围，执行1，直到找到相等的值
 * 4.如果最后找不到相等的值，则返回错误提示信息
 *
 * 按照二叉树来理解：中间值为二叉树的根，前半部分为左子树，后半部分为右子树
 * 折半查找法的查找次数正好为该值所在的层数，等概率情况下，约为log2(n+1)-1
 */

/**
 * @brief 非递归二分查找  
 * @param src 待查找数据
 * @param des 目标关键词
 * @param begin 开始位置
 * @param last 结束位置
 * @return 
 */
int BiSearch(char* des, const char** src, int begin, int last, int &cmp_count)  
{  
	int result = -1;  
	while(begin <= last)  
	{  
		cmp_count++;
		int mid = (begin + last) / 2;  
		if(strcmp(src[mid],des) > 0)  
			last = mid - 1;  
		else if(strcmp(src[mid],des) < 0)  
			begin = mid + 1;  
		else  
		{  
			if(result < mid)  
				result = mid;  
			begin = mid + 1;  
		}  
	}  
    return result;
}  

/**
 * @brief 读取统计源文件
 * @param path
 */
bool ReadSrcFileToBi(const char* filepath)
{
	cout << "================Reading source file...================" << endl;
	/**
	 * @brief 文件存在判断
	 * @param word
	 * @param SW
	 */
	ifstream fin(filepath);
	if(!fin)
	{
		cout << "================Error! File not exist!================" << endl;
		return false;
	}
	
	
	char word[MAXLEN],ch;
	int i;
	FILE *read;
	
	//只读方式打开一个文本文件,只允许读数据	
	if((read = fopen(filepath,"r")) == NULL)  
	{
		cout << "================Error! File not exist!================" << endl;
		return false;
	}

	while(!feof(read))  	//是否到文件尾
	{
		i = 0;
		ch = fgetc(read);		//读取一个字符
		
		//如果不是字母的话接着读取
		while(isLetter(ch) == 0 && feof(read) == 0) 
			ch = fgetc(read);
		
		//超过关键字长度将跳过当前识别区域,读取后一单词
		while(isLetter(ch) == 1 && feof(read) == 0)
		{
			if(i == MAXLEN)
			{
				while(isLetter(ch) == 1 && feof(read) == 0)
				{
					ch = fgetc(read);
				}
				i = 0;
				break;
			}
	
			else
			{  
				word[i++] = ch;
				ch = fgetc(read);
			}
		}
		word[i] = '\0';		//字符数组的结束标志
		if(isKeyWords(word))
		{
			countKeyWords(word, SW);
		}
	}
	fclose(read);
	cout << "================File read completed!================" << endl << endl;
	return true;
}


void countKeyWords(char* word, SeqWords* SW)
{
	if(!isKeyWords(word))
		return;
	int index = BiSearch(word, KeyWords, 0, TOTAL-1, bi_cmp_count);	
	if(index >= 0)
		SW[index].count++;
}

void initKeyWords(SeqWords* SW)
{
	for(int i = 0; i < TOTAL; i++)
	{
		strcpy(SW[i].keyword,KeyWords[i]);
		SW[i].length = strlen(SW[i].keyword);
		SW[i].count = 0;
	}
}

void ShowKeyWords(SeqWords* SW)
{
	for(int i = 0; i < TOTAL; i++)
	{
		cout << "[" << i << "]"  << setw(12) << "" << SW[i].keyword << setw(10) 
			<< "" << "Count: " << SW[i].count << endl;
	}
}

/**
 * @brief 判断是否关键字
 * @param word
 * @return 
 */
int isKeyWords(char* word)
{
	for(int i = 0; i < TOTAL; i++)
		if(strcmp(word,KeyWords[i]) == 0)
			return 1; 
	return 0;
} 

/**
 * @brief 判断是否是字母
 * @param ch
 * @return 
 */
int isLetter(char ch)
{
	if((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')) 
		return 1;
	else
		return 0;
} 