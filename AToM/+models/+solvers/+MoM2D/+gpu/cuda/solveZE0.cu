#include "ITT.cu"

template <typename T>
__device__ void solveZE0(T* outReal,
        const T* edgeLengths, const int* triaPlus, const int* triaMinus, const T scale,
        const T* p1, const T* p2, const T* p3, const T* xVec, const T* yVec, const T* zVec,
        const T* w, const T* s1, const T* s2, const T* s3,
        const T* m1, const T* m2, const T* m3,
        const int quad, const T* weight, const T* triaArea, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
           
  size_t const x = blockDim.x * blockIdx.x + threadIdx.x + xMin;
  size_t const y = blockDim.y * blockIdx.y + threadIdx.y + yMin;
  
  if(x >= xMax || y >= yMax) {
     return;
  }

  const int dim = 3;
  int m = triaPlus[x], n = triaPlus[y];
  T sum = 0, itt3;

  for(int i = 0; i < quad; i++) {
    itt3 = ITT3(&p1[m*dim], &p2[m*dim], &p3[m*dim], xVec[n*quad + i], yVec[n*quad + i], zVec[n*quad + i], &w[m*dim],
              &s1[m*dim], &s2[m*dim], &s3[m*dim], &m1[m*dim], &m2[m*dim], &m3[m*dim], weight[i]);
    sum += itt3 / triaArea[m];
  }
  
  m = triaPlus[x], n = triaMinus[y];
  for(int i = 0; i < quad; i++) {
    itt3 = ITT3(&p1[m*dim], &p2[m*dim], &p3[m*dim], xVec[n*quad + i], yVec[n*quad + i], zVec[n*quad + i], &w[m*dim],
             &s1[m*dim], &s2[m*dim], &s3[m*dim], &m1[m*dim], &m2[m*dim], &m3[m*dim], weight[i]);
    sum -= itt3 / triaArea[m];
  }

  m = triaMinus[x], n = triaPlus[y];
  for(int i = 0; i < quad; i++) {
    itt3 = ITT3(&p1[m*dim], &p2[m*dim], &p3[m*dim], xVec[n*quad + i], yVec[n*quad + i], zVec[n*quad + i], &w[m*dim],
             &s1[m*dim], &s2[m*dim], &s3[m*dim], &m1[m*dim], &m2[m*dim], &m3[m*dim], weight[i]);
    sum -= itt3 / triaArea[m];
  }

  m = triaMinus[x], n = triaMinus[y];
  for(int i = 0; i < quad; i++) {
    itt3 = ITT3(&p1[m*dim], &p2[m*dim], &p3[m*dim], xVec[n*quad + i], yVec[n*quad + i], zVec[n*quad + i], &w[m*dim],
             &s1[m*dim], &s2[m*dim], &s3[m*dim], &m1[m*dim], &m2[m*dim], &m3[m*dim], weight[i]);
    sum += itt3 / triaArea[m];
  }

  outReal[(x - xMin) + (y - yMin)*outputSize] = (edgeLengths[x] * edgeLengths[y] * sum) / scale;
}

__global__ void solveZE0f(float* outReal,
        const float* edgeLengths, const int* triaPlus, const int* triaMinus, const float scale,
        const float* p1, const float* p2, const float* p3, const float* x, const float* y, const float* z,
        const float* w, const float* s1, const float* s2, const float* s3,
        const float* m1, const float* m2, const float* m3,
        const int quad, const float* weight, const float* triaArea, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
  solveZE0(outReal, edgeLengths, triaPlus, triaMinus, scale,
        p1, p2, p3, x, y, z, w, s1, s2, s3, m1, m2, m3, quad,
        weight, triaArea, xMin, xMax, yMin, yMax, outputSize);
}

__global__ void solveZE0d(double* outReal,
        const double* edgeLengths, const int* triaPlus, const int* triaMinus, const double scale,
        const double* p1, const double* p2, const double* p3, const double* x, const double* y, const double* z,
        const double* w, const double* s1, const double* s2, const double* s3,
        const double* m1, const double* m2, const double* m3,
        const int quad, const double* weight, const double* triaArea, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
  solveZE0(outReal, edgeLengths, triaPlus, triaMinus, scale,
        p1, p2, p3, x, y, z, w, s1, s2, s3, m1, m2, m3, quad,
        weight, triaArea, xMin, xMax, yMin, yMax, outputSize);
}