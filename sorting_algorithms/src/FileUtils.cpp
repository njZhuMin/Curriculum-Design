#include "FileUtils.h"
#include "GlobalsDefine.h"

//////////////////////////输入输出流重定义//////////////////////////
/* For Windows:
 * freopen("CON", "w", stdout);
 * freopen("CON", "r", stdin);
 * For Linux:
 * freopen( "/dev/tty", "w", stdout );
 * freopen("/dev/console", "r", stdin);
 */
///////////////////////////////////////////////////////////////////

/**
 * @brief 生成10000个随机数写入文件
 */
void RanNumToFile(const char* path)
{
    //cout << "================Putting " << MAXSIZE << " random nunbers into file...================" << endl;
	srand(unsigned(time(0)));		//生成时间种子
	//随机数范围0-50000
	const int MAX = 50000;  
	const int MIN = 0;  

	//typedef long clock_t
	//clock_t start_time = clock();//计时开始 
	freopen(path, "w", stdout); 
	for(int i = 0; i < MAXSIZE; ++i)
	{
		unsigned long data = rand() % (MAX - MIN + 1) + MIN;  
		cout << setw(8) << data;
		if((i+1) % 20 == 0)
			cout << endl;
	}
	fclose(stdout);
	freopen("CON", "w", stdout);	
	//freopen( "/dev/tty", "w", stdout );
	cout << "================File write completed!================" << endl << endl; 
	
	//freopen("time.txt","w",stdout);  
	//cout << endl << "---the end---" << endl;  
	//CLOCKS_PER_SEC控制精度，在windows下是1000
	//cout << "Elapsed time:" << double(clock() - start_time) / CLOCKS_PER_SEC << 's' << endl;  
	//fclose(stdout);  
}

/**
 * @brief 从文件载入随机数
 * @param path
 * @param arr
 */
void LoadRanNumFromFile(const char* path, int* arr)
{
	/**
	 * @brief 文件存在判断
	 * @param word
	 * @param SW
	 */
	ifstream fin(path);
	if(!fin)
	{
		cout << "================Error! File not exist!================" << endl;
		return;
	}
	int i;
	freopen(path, "r" ,stdin);
	for(i = 0; i < MAXSIZE; ++i)
	{
		cin >> arr[i];
		if(!cin >> arr[i])
			break;
	}
	fclose(stdin);
	freopen("CON", "r", stdin);
	//freopen("/dev/console", "r", stdin);
}

/**
 * @brief 将排序数组写入文件
 * @param path
 * @param arr
 */
void SaveToFile(const char* path, int* arr)
{
	freopen(path, "w" ,stdout);
	for(int i = 0; i < MAXSIZE; ++i)
	{
		cout << setw(8) << arr[i];
		if((i+1) % 20 == 0)
			cout << endl;
	}
	fclose(stdout);
	freopen("CON", "w", stdout);
	//freopen( "/dev/tty", "w", stdout );
}

