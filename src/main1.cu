//#define Blind_EXPORT
#include "Blind.h"
#include "img.h"
#include <iostream>
// #include <fstream>
// #include <opencv2/opencv.hpp>

//using namespace cv;
int main() {

    // cv::Mat image = cv::imread("../data/img3.jpg", cv::IMREAD_GRAYSCALE);
    // cv::Mat binary_image;
    // threshold(image, binary_image, 0, 255, THRESH_BINARY_INV | THRESH_OTSU);
    // cv::Mat resized_image;
    // resize(binary_image, resized_image, Size(28, 28), INTER_AREA);
    // cv::Mat paddedImage;
    // int top = 2;    // 顶部填充像素数量
    // int bottom = 2; // 底部填充像素数量
    // int left = 2;   // 左侧填充像素数量
    // int right = 2;  // 右侧填充像素数量
    // cv::Scalar color(0, 0, 0); // 填充颜色（黑色）
    // cv::copyMakeBorder(resized_image, paddedImage, top, bottom, left, right, cv::BORDER_CONSTANT, color);

   
    // int rows = paddedImage.rows;
    // int cols = paddedImage.cols;

    // //int cnt=0;
    // for (int i = 0; i < rows; ++i) 
    // {
    //     for (int j = 0; j < cols; ++j) 
    //     {
    //         // 获取像素的灰度值
    //         img[i*cols+j]=  static_cast<double>(paddedImage.at<uchar>(i,j))/255.0;
    //         //std::cout <<img[i*cols+j]<< std::endl;
    //         //cnt++;
    //     }
       
    // }
    //std::cout<<cnt<<std::endl;
    double img[1024];
    char imgpath[]="../data/198.jpg";
    Imgprocess(imgpath,img);
    const char u[32] = "password";
	char path[]="/home/blind/extend/ghh/testdll";
	InitNet(u,path,0);
    std::cout<<BlindMnist(img)<<std::endl;
    return 0;
}
