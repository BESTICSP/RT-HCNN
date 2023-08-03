#pragma once

#ifndef Blind_EXPORT

#define Blind_EXPORT

extern "C" __attribute__((visibility("default"))) void InitNet(const char *userKey, int dev_num);
extern "C" __attribute__((visibility("default"))) int BlindMnist(double *pData);

#endif
