# GPU Accelerated Full Homomorphic Encryption Cryptosystem, Library and Applications for IoT Systems
# GPU加速的全同态加密系统、库和应用 

Deep learning such as convolutional neural networks (CNNs) have been utilized in a number of cloud-based Internet of Things (IoT) applications. Security and privacy are two key considerations in any commercial deployments. Fully homomorphic encryption (FHE) is a popular privacy protection approach, and there have been attempts to integrate FHE with CNNs. However, a simple integration may lead to inefficiency in single-user services and fail to support many of the requirements in real-time applications. In this paper, we propose a novel confused modulo projection based FHE algorithm (CMP-FHE) that is designed to support floating-point operations. Then we developed a parallelized runtime library based on CMP-FHE and compared it with the widely employed FHE library. Our results show that our library achieves a faster speeds. Furthermore, we compared it with the state-of-the-art confused modulo projection based library and the results demonstrated a speed improvement of 841.67 to 3056.25 times faster.
Additionally, we construct a Real-Time Homomorphic Convolutional Neural Network (RT-HCNN) under the ciphertext-based framework using CMP-FHE, as well as using graphics processing units (GPUs) to facilitate acceleration. To demonstrate utility, we evaluate the proposed approach on the MNIST dataset. Findings demonstrate that our proposed approach achieves a high accuracy rate of 99.13 %. Using GPUs acceleration for ciphertext prediction results in us achieving a single prediction time of 79.5 ms. This represents the first homomorphic CNN capable of supporting real-time application and is approximately 58 times faster than Microsoft's Lola scheme.

## Experimental environment:

| Item          | Specification            | Item               | Specification           |
| ------------- | ------------------------ | ------------------ | ----------------------- |
| CPU           | Intel(R)Xeon(R)Gold6258R | GPU                | NVIDIA GeForce RTX 3090 |
| \#of Cores    | 28                       | \#of Cores         | 10496                   |
| \#of Threads  | 112                      | Compute Capability | 8.6                     |
| CPU Frequency | 2.70GHz                  | GPU Core Frequency | 1695 MHz                |
| System Memory | 24GB *4 DDR4             | GPU Memory         | 24GB                    |
| OS            | Ubuntu 20.04.1           | CUDA Version       | 10.2                    |

We have encapsulated the MNIST network code as libBlindMnist.so from the paper，You can run the code with the following command.

```
mkdir build
cd build
cmake ..
make
./myapp
```

It will generate output similar to

```
Parameter generation completed
using Device 2: NVIDIA GeForce RTX 3090
Loading Net...
Network initialization completed
7
2
1
0
4
1
4
9
5
9
```



Table 1 .Comparison of Prediction Process Time: Prior FHE-based privacy-preserving neural networks vs. RT-HCNN

| Model                              | Layer number | DL technique | Accuracy(%) |
| ---------------------------------- | ------------ | ------------ | ----------- |
| CryptoNets                         | 5            | CNN          | 98.85       |
| FHE-DiNN100                        | 5            | BNN          | 96.35       |
| LoLa                               | 6            | CNN          | 98.95       |
| HCNN                               | 5            | CNN          | 99          |
| Jang et al.~\cite{jang2022privacy} | -            | RNN          | 94.2        |
| RT-HCNN                            | 9            | CNN          | 99.13       |

Table 2 .Comparison of Prediction Process Time: Prior FHE-based privacy-preserving neural networks vs. RT-HCNN

| Model       | Time enc(s) | Time eval(s) | Time dec(s) |
| ----------- | ----------- | ------------ | ----------- |
| FHE-DiNN100 | 0.000168    | 1.65         | 0.0000106   |
| LoLa        | 0.192       | 4.61         | 0.2029      |
| SHE         | -           | 9.3          | -           |
| HCNN        | -           | 14.1         | -           |
| RT-HCNN     | 0.03003     | 0.0795       | 0.0203      |

MIT license

Programmer: Hehe Gao

Email: ghh986@163.com  zjy@besti.edu.cn

Xiaodong Li, Hehe Gao,  Jianyi Zhang, Shuya Yang, Xin Jin,  Kim-Kwang Raymond Choo. GPU Accelerated Full Homomorphic Encryption Cryptosystem, Library and Applications for IoT Systems.

北京电子科技学院CSP实验室
