#include "HashSearch.h"
	
	int hash_cmp_count = 0;
	HashTable HS[HASHLEN];
	
	
//读取文件前先清空Hash表
void HASH::ResetHX()
{
	for(int i = 0; i < HASHLEN; i++)
	{
		strcpy(HS[i].keyword,""); 
		HS[i].count = 0;
		HS[i].con = 0;
	}
}

/**
 * @brief 建立Hash表
 * @param keyword
 * @return 
 */
int HASH::CreatHX(char* keyword, int &cmp_count)
{
	if(!isKeyWords(keyword))		//非关键字
		return -1; 
	int key = Hash(keyword); 			//计算Hash值
	
	//判断关键字表中该位置是否存在关键字
	if(strlen(HS[key].keyword) > 0)
	{
		//再判断Hash表中该位置的关键字是否相同
		if(strcmp(HS[key].keyword,keyword) == 0)
		{  
			HS[key].count++;
			return 1;
		}
		key = FindHX(keyword, cmp_count);  //不相同，继续查找
		if(key < 0)
		{
			key = GetFreePos(Hash(keyword));
			if(key < 0)
				return -1;
			strcpy(HS[key].keyword,keyword);  //将关键字插入Hash表
		}

		if(key < 0)
			return -1;
		HS[key].count++;
	}
	else		//该位置为空，直接将关键字插入该位置中
	{
		strcpy(HS[key].keyword,keyword);
		HS[key].count++;
	}
	return 1;
}

/**
 * @brief 计算Hash值
 * @brief Hash(Key)=[(Key的首字母序号)*100+(Key的尾字母序号)] Mod 41
 * @param keyword
 * @return 
 */
int HASH::Hash(const char* keyword)
{  
	return (keyword[0] * 100 + keyword[strlen(keyword)-1]) % 41;
}


/**
 * @brief 查找Hash表，分块查找
 * @param keyword
 * @return 
 */
int HASH::FindHX(char* keyword, int &cmp_count)   
{
	int key, find;
	//int temp = 0;
	if(!isKeyWords(keyword))
		return -1;
	key = Hash(keyword);  
	
	if(strcmp(HS[key].keyword,keyword) == 0) 
	{
		cmp_count++;
		return key;
	}

	
	//线性探查法顺序查找Hash表中是否已存在关键字
	for(find = key + 1; find < HASHLEN; find++)
	{		
		cmp_count++;
		//temp++;		//统计冲突次数
		if(strcmp(HS[find].keyword,keyword) == 0)
		{
			HS[find].con++;
			return find;
		}
	}	
	for(find = 0; find < key; find++)
	{
		cmp_count++;
		//temp++;
		if(strcmp(HS[find].keyword,keyword) == 0)
		{
			HS[find].con++;
			return find;
		}
	}	
	return -1;
} 

/**
 * @brief 线性探测Hash表空位
 * @param key
 * @return 
 */
int HASH::GetFreePos(int key) 
{
	int find;
	//int temp = 0;
	if(key < 0 || key >= HASHLEN)
		return -1;
		
	for(find = key + 1; find < HASHLEN; find++)		//向后探测
	{
		//temp++;
		if(strlen(HS[find].keyword) == 0)
		{
			HS[find].con++;
			return find;
		}
	}

	for(find = 0; find < key; find++)		//向前探测
	{
		//temp++;
		if(strlen(HS[find].keyword) == 0)
		{
			HS[find].con++;
			return find; 
		}
	}
	return -1; 		//Hash表已满
}


/**读取文件前必须先调用ResetHX()函数清空Hash表！**/
/**
 * @brief 读取统计源文件
 * @param path
 */
bool HASH::ReadSrcFileToHX(const char* filepath)
{
	cout << "================Reading source file...================" << endl;
	char word[MAXLEN],ch;
	int i;
	FILE *read;
	/* fstream fin(filepath);
	* if(!fin)
	* {
	*	cout << "================Error! File not exist!================" << endl;
	*	return false;
	* }
	* */
	//只读方式打开一个文本文件,只允许读数据	
	if((read = fopen(filepath,"r")) == NULL)  
	{
		cout << "================Error! File not exist!================" << endl;
		return false;
	}
	ResetHX();		//清空Hash表

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
			CreatHX(word, hash_cmp_count);
		}
	}
	fclose(read);
	cout << "================File read completed!================" << endl;
	return true;
}

/**
 * @brief 显示关键字的频度
 * @param key
 */
int HASH::ShowHashTable(int key)
{
	int hash_count = 0;
	if(key < 0 || key >= HASHLEN)
	{
		cout << "Error! Invalid key word!" << endl;
		return 0;
	}
	if(strlen(HS[key].keyword) == 0)
	{
		cout << setiosflags(ios::left) << setw(2) << "[" << key << "]" << setw(12) << "" << "N/A" << endl;
		return 0;
	}
	cout << setiosflags(ios::left) << setw(2) << "[" << key << "]" << setw(12) 
		<< HS[key].keyword << setw(12) << "Count: " << HS[key].count << endl;
	hash_count++;
	return hash_count;
}

/**
 * @brief 判断是否关键字
 * @param word
 * @return 
 */
int HASH::isKeyWords(char* word)
{
	for(int i = 0; i < TOTAL; i++)
	{
		if(strcmp(word,KeyWords[i]) == 0)
			return 1;
	}	 
	return 0;
} 

/**
 * @brief 判断是否是字母
 * @param ch
 * @return 
 */
int HASH::isLetter(char ch)
{
	if((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')) 
		return 1;
	else
		return 0;
} 