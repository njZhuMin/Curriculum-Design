#ifndef BASICSORT_H
#define BASICSORT_H

#include <iostream>
#include <cstdlib>
#include <ctime>
#include <cstring>
using namespace std;


//declaration
void swap(int &a, int &b);
template <class T>
int getArrayLen(T& array);

void ShellSort(int* arr, int n);				//Shell排序算法
void QuickSort(int* arr, int i, int j);			//快速排序算法
void HeapSort(int *a, int size);			    //堆排序 
void MergeSort(int *arr, int n);				//归并排序算法

int getPartition(int* arr, int i, int j);			//快速排序数组划分算法			
void HeapAdjust(int *a, int i, int size);			//堆调整算法
void BuildHeap(int *a, int size);					//建立大顶堆

void Merge(int *arr, int first, int mid, int last, int *temp);	//一次归并算法
void MergePass(int *arr, int first, int last, int *temp);		//一趟归并算法


#endif // BASICSORT_H
