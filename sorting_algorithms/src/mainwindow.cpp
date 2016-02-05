#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "BasicSort.h"
#include "FileUtils.h"
#include "GlobalsDefine.h"
#include <ctime>
#include <direct.h>

QVector<double> sort_time(4);
time_t t_start[10];
time_t t_end[10];

void doSort();
double get_time(time_t t_start, time_t t_end);

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    this->init_ui();
}

void MainWindow::init_ui()
{
    QVector<QString> labels(4);
    doSort();

    //横坐标标签与赋值
    labels[0] = QString("ShellSort");
    labels[1] = QString("QuickSort");
    labels[2] = QString("HeapSort");
    labels[3] = QString("MergeSort");

    //QCustomPlot提供的QCPBars来表示柱状图
    QCPBars* bars = new QCPBars(this->ui->widget->xAxis, this->ui->widget->yAxis);
    QVector<double> index(4);
    for(int i = 0; i < 4; ++i)
        index[i] = i;
    bars->setData(index, sort_time);

    //关闭默认的底部标签自动生成
    this->ui->widget->xAxis->setAutoTicks(false);
    this->ui->widget->xAxis->setAutoTickLabels(false);
    this->ui->widget->xAxis->setAutoTickStep(false);

    //将bars添加到widget上，自动调整坐标系
    this->ui->widget->addPlottable(bars);
    this->ui->widget->rescaleAxes();

    //生成标签的位置坐标
    double wid = this->ui->widget->xAxis->range().upper-this->ui->widget->xAxis->range().lower;
    double cl = bars->width()+(1.0*wid-bars->width()*4)/3;

    QVector<double> coor;
    for(int i = 0; i < 4; ++i)
    {
        coor.append(this->ui->widget->xAxis->range().lower+i*cl+bars->width()/2);
    }
    this->ui->widget->xAxis->setTickVector(coor);
    this->ui->widget->xAxis->setTickVectorLabels(labels);

    //replot
    this->ui->widget->replot();

    QString str[4];
    for(int i = 0; i < 4; i++)
    {
        str[i].setNum(sort_time[i]);
        labels[i] = labels[i] + "\t" + str[i] + "ms";
        this->ui->textBrowser->append(labels[i]);
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}


void doSort()
{
    mkdir("results");
    RanNumToFile("results/Random_Number");		//生成10000个随机数写入文件

    int arr[MAXSIZE];
    int len = MAXSIZE;
    //double temp[4];

    LoadRanNumFromFile("results/Random_Number",arr);
    t_start[0] = clock();
    ShellSort(arr,len);
    t_end[0] = clock();
    SaveToFile("results/Shell_Sort",arr);
    //sort_time[0] = get_time(t_start[0],t_end[0]);

    LoadRanNumFromFile("results/Random_Number",arr);
    t_start[1] = clock();
    QuickSort(arr, 0, len - 1);
    t_end[1] = clock();
    SaveToFile("results/Quick_Sort",arr);
    //sort_time[1] = get_time(t_start[1],t_end[1]);

    LoadRanNumFromFile("results/Random_Number",arr);
    t_start[2] = clock();
    HeapSort(arr, len);
    t_end[2] = clock();
    SaveToFile("results/Heap_Sort",arr);
    //sort_time[2] = get_time(t_start[2],t_end[2]);

    LoadRanNumFromFile("results/Random_Number",arr);
    t_start[3] = clock();
    MergeSort(arr,len);
    t_end[3] = clock();
    SaveToFile("results/Merge_Sort",arr);
    //sort_time[3] = get_time(t_start[3],t_end[3]);

    sort_time[0] = get_time(t_start[0],t_end[0]);
    sort_time[1] = get_time(t_start[1],t_end[1]);
    sort_time[2] = get_time(t_start[2],t_end[2]);
    sort_time[3] = get_time(t_start[3],t_end[3]);
}

double get_time(time_t t_start, time_t t_end)
{
    return (t_end - t_start) * 1000 / CLOCKS_PER_SEC;
}
