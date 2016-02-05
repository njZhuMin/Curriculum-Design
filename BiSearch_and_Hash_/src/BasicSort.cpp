#include "BasicSort.h"
/**
 * @brief Shell排序算法
 * @param arr
 * @param n
 * @return 
 */
void ShellSort(int* arr, int n)  
{
	int i, j, gap; 
	for(gap = n / 2; gap > 0; gap = gap / 2)
	{  
		for(i = gap; i < n; i++)
		{
			for(j = i - gap; j >= 0 && arr[j] > arr[j + gap]; j = j - gap) 
			{
				swap(arr[j], arr[j + gap]); 

			}
		}
	}
}

/**
 * @brief 快速排序数组划分算法
 * @param arr
 * @param i
 * @param j
 * @return 
 */
int getPartition(int* arr, int i, int j)  
{  
	int temp = arr[i]; 
	while(i < j)  
	{  
		//从右向左找小于x的数来填s[i]  
		while(i < j && arr[j] >= temp)   
			j--;    
		if(i < j) 	
			arr[i++] = arr[j]; 		//将s[j]填到s[i]中，s[j]就形成了一个新的坑  
		//从左向右找大于或等于x的数来填s[j]  
		while(i < j && arr[i] <= temp)  
			i++;    
		if(i < j)  
			arr[j--] = arr[i];
	}  
    //退出时，i等于j。将x填到这个坑中。  
	arr[i] = temp;  
	return i;  
}  

/**
 * @brief 快速排序算法
 * @param arr
 * @param i
 * @param j
 */
void QuickSort(int* arr, int i, int j)
{
	if(i < j)
	{
		int pivot = getPartition(arr, i, j);
		QuickSort(arr, i, pivot - 1);
		QuickSort(arr, pivot + 1, j);
	}
}

////////////////////////////////堆结构存储///////////////////////////////
/* 一般用数组来表示堆，i结点的父结点下标为(i – 1)/2
 * 它的左右子结点下标分别为2*i+1和2*i+2
 * 如第0个结点左右子结点下标分别为1和2
 *
 *				 10				
 *		  	   /   \
 *		  	  /     \			-------------------------------
 *	  	    15      56			| 10 | 15 | 56 | 25 | 30 | 70 |
 *	       / \      /			-------------------------------
 * 	      /   \    /
 *	     25   30  70
 *		   逻辑结构							存储结构
 */
/////////////////////////////////////////////////////////////////////////
/**
 * @brief 把二叉树中以i为根的子树变成最大堆。
 * @brief 注意: 使用的前提条件是i节点的左右子树(如果存在的话)都是最大堆
 * @param a
 * @param i
 * @param size
 */
void HeapAdjust(int *a, int i, int size)  //调整堆 
{
    int lchild = 2 * i;       	//i的左孩子节点序号 
    int rchild = 2 * i + 1;   	//i的右孩子节点序号 
    int max = i;         		//临时变量 
    if(i <= size / 2)        	//如果i是叶节点就不用进行调整 
    {
        if(lchild < size && a[lchild] > a[max])
        {
            max = lchild;
        }    
        if(rchild < size && a[rchild] > a[max])
        {
            max = rchild;
        }
        if(max != i)
        {
            swap(a[i], a[max]);
            HeapAdjust(a, max, size);    //避免调整之后以max为父节点的子树不是堆 
        }
    }        
}

void BuildHeap(int *a, int size)    //建立堆 
{
    int i;
    for(i = size / 2; i >= 0; i--)    //非叶节点最大序号值为size/2 
    {
        HeapAdjust(a, i, size);    
    }    
} 

void HeapSort(int *a, int size)    //堆排序 
{
    int i;
    BuildHeap(a, size);
    for(i = size - 1; i > 0; i--)
    {
        swap(a[0], a[i]);           //交换堆顶和最后一个元素，即每次将剩余元素中的最大者放到最后面 
		//BuildHeap(a, i-1);        //将余下元素重新建立为大顶堆 
		HeapAdjust(a, 0, i);  		//重新调整堆顶节点成为大顶堆
    }
} 

/**
 * @brief 一次归并算法
 * @param arr
 * @param first
 * @param mid
 * @param last
 * @param temp
 */
void Merge(int *arr, int first, int mid, int last, int *temp)  
{  
    int i = first, j = mid + 1;  
    int m = mid, n = last;  
    int k = 0;  
    while(i <= m && j <= n)  
    {  
		if(arr[i] <= arr[j])  
			temp[k++] = arr[i++];  
        else  
			temp[k++] = arr[j++];  
	}  
	while(i <= m)  
		temp[k++] = arr[i++];  
	while(j <= n)  
		temp[k++] = arr[j++];  
	for(i = 0; i < k; i++)  
		arr[first + i] = temp[i];  
}  

/**
 * @brief 一趟归并算法
 * @param arr
 * @param first
 * @param last
 * @param temp
 */
void MergePass(int *arr, int first, int last, int *temp)  
{  
	if(first < last)  
	{  
		int mid = (first + last) / 2;  
		MergePass(arr, first, mid, temp);    //左边有序  
		MergePass(arr, mid + 1, last, temp); //右边有序  
		Merge(arr, first, mid, last, temp); //再将二个有序数列合并  
    }
}  

/**
 * @brief 归并排序算法
 * @param arr
 * @param n
 */
void MergeSort(int *arr, int n)  
{  
	int *temp = new int[n];  
	if(temp == NULL)  
		return;  
	MergePass(arr, 0, n - 1, temp);  
	delete[] temp;  
}  


void swap(int &a, int &b)
{
    int temp;
    temp = a;
    a = b;
    b = temp;
}

/**
 * @brief 使用模板定义一 个函数getArrayLen
 * @brief 返回数组array的长度
 * @param array
 * @return 
 */
template <class T>
int getArrayLen(T& array)
{
	return (sizeof(array) / sizeof(array[0]));
}
