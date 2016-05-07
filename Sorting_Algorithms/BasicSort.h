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

void ShellSort(int* arr, int n);					//Shell排序算法
void QuickSort(int* arr, int i, int j);			//快速排序算法
void HeapSort(int *a, int size);			    //堆排序 

int getPartition(int* arr, int i, int j);			//快速排序数组划分算法			
void HeapAdjust(int *a, int i, int size);
void BuildHeap(int *a, int size);

void Merge(int *arr, int first, int mid, int last, int *temp);	//一次归并算法
void MergePass(int *arr, int first, int last, int *temp);		//一趟归并算法
void MergeSort(int *arr, int n);	//归并算法

void Sift(int* arr, int k, int m);
void BuildHeap2(int* arr, int n);
void HeapSort2(int* arr, int n);

#endif // BASICSORT_H
