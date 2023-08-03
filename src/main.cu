//#define Blind_EXPORT
#include "Blind.h"
#include <iostream>
#include <fstream>


typedef struct _MnistData
{
    double **pData; // 图像数据
    int *pLable;    // 标签数据

    int nWidth;       // 图像宽度
    int nHeight;      // 图像高度
    int nNumber;      // 图像数量
    int nClassNumber; // 类别数量

    _MnistData() : pData(nullptr), nWidth(0), nHeight(0), nClassNumber(10) {}

} MnistData, *PMnistData;

int ReversalInt(int nValue) // 把一个整数的各字节颠倒顺序
{
    unsigned char cTemp1 = nValue & 255;
    unsigned char cTemp2 = (nValue >> 8) & 255;
    unsigned char cTemp3 = (nValue >> 16) & 255;
    unsigned char cTemp4 = (nValue >> 24) & 255;
    int nData = static_cast<int>(cTemp1) << 24;
    nData += static_cast<int>(cTemp2) << 16;
    nData += static_cast<int>(cTemp3) << 8;
    return nData + cTemp4;
}
bool ReadMnistData(MnistData &stMnist, const char *StrPath, int nPadding)
{
    int i, j;
    std::string strPath = StrPath;
    if (strPath.empty())
    {
        std::cout << "文件打开失败";
        return false;
    }

    // 二进制方式读取
    std::ifstream cMnistFile(strPath, std::ios::in | std::ios::binary);;
    if (!cMnistFile.is_open())
    {
        std::cout << "文件打开失败";
        return false;
    }

    int nMagic = 0, nNumber = 0, nWidth = 0, nHeight = 0;

    // read(unsigned char *buf, int num);read()从文件中读取 num 个字符到 buf 指向的缓存中
    cMnistFile.read(reinterpret_cast<char *>(&nMagic), sizeof(nMagic));
    cMnistFile.read(reinterpret_cast<char *>(&nNumber), sizeof(nNumber));
    cMnistFile.read(reinterpret_cast<char *>(&nWidth), sizeof(nWidth));
    cMnistFile.read(reinterpret_cast<char *>(&nHeight), sizeof(nHeight));

    nMagic = ReversalInt(nMagic);
    if (nMagic != 2051)
    {
        std::cout << nMagic;
        return false;
    }

    nNumber = ReversalInt(nNumber);
    nWidth = ReversalInt(nWidth);
    nHeight = ReversalInt(nHeight);

    stMnist.nNumber = nNumber;

    // 这里加上填充，乘以2是为了上下和左右都加上填充
    stMnist.nWidth = nWidth + nPadding * 2;
    stMnist.nHeight = nHeight + nPadding * 2;
    int nSize = stMnist.nWidth * stMnist.nHeight;

    stMnist.pData = new double *[nNumber];

    // 图像数量
    for (i = 0; i < nNumber; i++)
    {
        // 初始化为-1.0
        stMnist.pData[i] = new double[nSize];
        for (j = 0; j < nSize; j++)
            stMnist.pData[i][j] = 0.0;

        for (j = 0; j < nHeight; j++)
        {
            for (int k = 0; k < nWidth; k++)
            {
                unsigned char cTemp;
                cMnistFile.read(reinterpret_cast<char *>(&cTemp), sizeof(cTemp));
                double dTemp = (static_cast<double>(cTemp) / 255.0);
                // double dTemp = static_cast<double>(cTemp) / 255.0;
                // cout << dTemp << endl;
                stMnist.pData[i][(j + nPadding) * stMnist.nWidth + k + nPadding] = dTemp;
            }
        }
    }

    cMnistFile.close();

    return true;
}


int main() {
    //const char s1[128] = "../data/t10k-images.idx3-ubyte";
	//const char s2[128] = "../data/t10k-labels.idx1-ubyte";

	const char u[32] = "233";
	std::ifstream inputFile("../data/rData.txt"); // 打开文件

    if (!inputFile) {
        std::cout << "无法打开文件 data.txt" << std::endl;
        return 1;
    }

    const int size = 1024; // 数组的大小
    double numbers[size]; // 存储读取的整数

    double num;
    int count = 0;
	memset(numbers,0,sizeof numbers);
    while (inputFile >> num && count < size) {
        numbers[count] =num;
        count++;
    }

    inputFile.close(); // 关闭文件
	
    //打印读取的整数
    for (int i = 0; i < count; i++) {
        std::cout<<i<<": "<< numbers[i] << std::endl;
    }
    std::cout<<count<<"\n";
    //std::cout << std::endl;
    cahrchar path[]="/home/blind/extend/ghh/testdll/para";
	InitNet(u,path,0);
   // MnistData stTestSet;
    //ReadMnistData(stTestSet,s1,2);
    // std::ofstream outputFile("1.txt");
    // for(int i=0;i<1024;i++)
	// {	
	//    outputFile<<stTestSet.pData[1][i]<<std::endl;
	// }

    // for(int i=0;i<10;i++)
    // {
    std::cout<<BlindMnist(numbers)<<std::endl;
    // }   
    return 0;
}
