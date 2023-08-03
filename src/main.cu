#include "Blind.h"
#include <iostream>
#include <fstream>


typedef struct _MnistData
{
    double **pData; 
    int *pLable;    

    int nWidth;      
    int nHeight;      
    int nNumber;     
    int nClassNumber; 

    _MnistData() : pData(nullptr), nWidth(0), nHeight(0), nClassNumber(10) {}

} MnistData, *PMnistData;

int ReversalInt(int nValue) 
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
        std::cout << "Open Erro";
        return false;
    }

    // 二进制方式读取
    std::ifstream cMnistFile(strPath, std::ios::in | std::ios::binary);;
    if (!cMnistFile.is_open())
    {
        std::cout << "Open Erro";
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

    stMnist.nWidth = nWidth + nPadding * 2;
    stMnist.nHeight = nHeight + nPadding * 2;
    int nSize = stMnist.nWidth * stMnist.nHeight;

    stMnist.pData = new double *[nNumber];

    for (i = 0; i < nNumber; i++)
    {
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
                stMnist.pData[i][(j + nPadding) * stMnist.nWidth + k + nPadding] = dTemp;
            }
        }
    }

    cMnistFile.close();

    return true;
}


int main() {
    const char s1[128] = "../data/t10k-images.idx3-ubyte";
	const char u[32] = "233";
    int devnum=2;
	
	InitNet(u,devnum);
    MnistData stTestSet;
    ReadMnistData(stTestSet,s1,2);
   
    for(int i=0;i<10;i++)
    {
        std::cout<<BlindMnist(stTestSet.pData[i])<<std::endl;
    }   
    return 0;
}
