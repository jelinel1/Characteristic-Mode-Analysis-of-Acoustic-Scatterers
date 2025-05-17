#include "ITT.cu"

template <typename T>
__device__ void solveZM0(T* outReal,
        const T* edgeLengths, const int* triaPlus, const int* triaMinus, const T scale,
        const T* p1, const T* p2, const T* p3, const T* xVec, const T* yVec, const T* zVec,
        const T* u, const T* v, const T* w, const T* s1, const T* s2, const T * s3,
        const T* m1, const T* m2, const T* m3, const int quad,
        const T* weight, const T* triaArea, const T* rPlus, const T* rMinus, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
  
  size_t const x = blockDim.x * blockIdx.x + threadIdx.x + xMin;
  size_t const y = blockDim.y * blockIdx.y + threadIdx.y + yMin;
  
  if(x >= xMax || y >= yMax) {
     return;
  }

  const int dim = 3;
  T tmp_pp[dim] = { 0 }, tmp_mp[dim] = { 0 }, tmp_pm[dim] = { 0 }, tmp_mm[dim] = { 0 };
  int m = triaPlus[y], n = triaPlus[x];
  T ITT1 = 0, ITT3 = 0;
  T sum = 0;

  for(int i = 0; i < quad; i++) {
    ITT(ITT1, tmp_pp[0], tmp_pp[1], tmp_pp[2], ITT3, &p1[n*dim], &p2[n*dim], &p3[n*dim], xVec[m*quad + i],
        yVec[m*quad + i], zVec[m*quad + i], &u[n*dim], &v[n*dim], &w[n*dim],
        &s1[n*dim], &s2[n*dim], &s3[n*dim], &m1[n*dim], &m2[n*dim], &m3[n*dim], weight[i], triaArea[n]);
  }
  sum += ITT1;
  sum += dotProduct3(&rPlus[y*dim], &rPlus[x*dim]) * ITT3;
  sum -= dotProduct3Static(tmp_pp, &rPlus[x*dim]);
  
  m = triaMinus[y], n = triaPlus[x];
  ITT1 = 0, ITT3 = 0;
  for(int i = 0; i < quad; i++) {
    ITT(ITT1, tmp_mp[0], tmp_mp[1], tmp_mp[2], ITT3, &p1[n*dim], &p2[n*dim], &p3[n*dim], xVec[m*quad + i],
        yVec[m*quad + i], zVec[m*quad + i], &u[n*dim], &v[n*dim], &w[n*dim],
        &s1[n*dim], &s2[n*dim], &s3[n*dim], &m1[n*dim], &m2[n*dim], &m3[n*dim], weight[i], triaArea[n]);
  }
  sum -= ITT1;
  sum -= dotProduct3(&rMinus[y*dim], &rPlus[x*dim]) * ITT3;
  sum += dotProduct3Static(tmp_mp, &rPlus[x*dim]);
  
  m = triaPlus[y], n = triaMinus[x];
  ITT1 = 0, ITT3 = 0;
  for(int i = 0; i < quad; i++) {
    ITT(ITT1, tmp_pm[0], tmp_pm[1], tmp_pm[2], ITT3, &p1[n*dim], &p2[n*dim], &p3[n*dim], xVec[m*quad + i],
        yVec[m*quad + i], zVec[m*quad + i], &u[n*dim], &v[n*dim], &w[n*dim],
        &s1[n*dim], &s2[n*dim], &s3[n*dim], &m1[n*dim], &m2[n*dim], &m3[n*dim], weight[i], triaArea[n]);
  }
  sum -= ITT1;
  sum -= dotProduct3(&rMinus[x*dim], &rPlus[y*dim]) * ITT3;
  sum += dotProduct3Static(tmp_pm, &rMinus[x*dim]);

  m = triaMinus[y], n = triaMinus[x];
  ITT1 = 0, ITT3 = 0;
  for(int i = 0; i < quad; i++) {
    ITT(ITT1, tmp_mm[0], tmp_mm[1], tmp_mm[2], ITT3, &p1[n*dim], &p2[n*dim], &p3[n*dim], xVec[m*quad + i],
        yVec[m*quad + i], zVec[m*quad + i], &u[n*dim], &v[n*dim], &w[n*dim],
        &s1[n*dim], &s2[n*dim], &s3[n*dim], &m1[n*dim], &m2[n*dim], &m3[n*dim], weight[i], triaArea[n]);
  }
  sum += ITT1;
  sum += dotProduct3(&rMinus[y*dim], &rMinus[x*dim]) * ITT3;
  sum -= dotProduct3Static(tmp_mm, &rMinus[x*dim]);

  /*---------------------------------*/
      
  tmp_pp[0] = 0;
  tmp_pp[1] = 0;
  tmp_pp[2] = 0;
  m = triaPlus[x], n = triaPlus[y];
  for(int i = 0; i < quad; i++) {
    ITT(ITT1, tmp_pp[0], tmp_pp[1], tmp_pp[2], ITT3, &p1[n*dim], &p2[n*dim], &p3[n*dim], xVec[m*quad + i],
        yVec[m*quad + i], zVec[m*quad + i], &u[n*dim], &v[n*dim], &w[n*dim],
        &s1[n*dim], &s2[n*dim], &s3[n*dim], &m1[n*dim], &m2[n*dim], &m3[n*dim], weight[i], triaArea[n]);
  }
  sum -= dotProduct3Static(tmp_pp, &rPlus[y*dim]);

  tmp_mp[0] = 0;
  tmp_mp[1] = 0;
  tmp_mp[2] = 0;
  m = triaMinus[x], n = triaPlus[y];
  for(int i = 0; i < quad; i++) {
    ITT(ITT1, tmp_mp[0], tmp_mp[1], tmp_mp[2], ITT3, &p1[n*dim], &p2[n*dim], &p3[n*dim], xVec[m*quad + i],
        yVec[m*quad + i], zVec[m*quad + i], &u[n*dim], &v[n*dim], &w[n*dim],
        &s1[n*dim], &s2[n*dim], &s3[n*dim], &m1[n*dim], &m2[n*dim], &m3[n*dim], weight[i], triaArea[n]);
  }
  sum += dotProduct3Static(tmp_mp, &rPlus[y*dim]);

  tmp_pm[0] = 0;
  tmp_pm[1] = 0;
  tmp_pm[2] = 0;
  m = triaPlus[x], n = triaMinus[y];
  for(int i = 0; i < quad; i++) {
    ITT(ITT1, tmp_pm[0], tmp_pm[1], tmp_pm[2], ITT3, &p1[n*dim], &p2[n*dim], &p3[n*dim], xVec[m*quad + i],
        yVec[m*quad + i], zVec[m*quad + i], &u[n*dim], &v[n*dim], &w[n*dim],
        &s1[n*dim], &s2[n*dim], &s3[n*dim], &m1[n*dim], &m2[n*dim], &m3[n*dim], weight[i], triaArea[n]);
  }
  sum += dotProduct3Static(tmp_pm, &rMinus[y*dim]);

  tmp_mm[0] = 0;
  tmp_mm[1] = 0;
  tmp_mm[2] = 0;
  m = triaMinus[x], n = triaMinus[y];
  for(int i = 0; i < quad; i++) {
    ITT(ITT1, tmp_mm[0], tmp_mm[1], tmp_mm[2], ITT3, &p1[n*dim], &p2[n*dim], &p3[n*dim], xVec[m*quad + i],
        yVec[m*quad + i], zVec[m*quad + i], &u[n*dim], &v[n*dim], &w[n*dim],
        &s1[n*dim], &s2[n*dim], &s3[n*dim], &m1[n*dim], &m2[n*dim], &m3[n*dim], weight[i], triaArea[n]);
  }
  sum -= dotProduct3Static(tmp_mm, &rMinus[y*dim]);

  outReal[(x - xMin) + (y - yMin)*outputSize] = (edgeLengths[x] * edgeLengths[y] * sum) / scale;
}

__global__ void solveZM0f(float* outReal,
        const float* edgeLengths, const int* triaPlus, const int* triaMinus, const float scale,
        const float* p1, const float* p2, const float* p3, const float* x, const float* y, const float* z,
        const float* u, const float* v, const float* w, const float* s1, const float* s2, const float* s3,
        const float* m1, const float* m2, const float* m3, const int quad,
        const float* weight, const float* triaArea, const float* rPlus, const float* rMinus, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
  solveZM0(outReal, edgeLengths, triaPlus, triaMinus, scale,
        p1, p2, p3, x, y, z, u, v, w, s1, s2, s3, m1, m2, m3,
        quad, weight, triaArea, rPlus, rMinus, xMin, xMax, yMin, yMax, outputSize);
}

__global__ void solveZM0d(double* outReal,
        const double* edgeLengths, const int* triaPlus, const int* triaMinus, const double scale,
        const double* p1, const double* p2, const double* p3, const double* x, const double* y, const double* z,
        const double* u, const double* v, const double* w, const double* s1, const double* s2, const double* s3,
        const double* m1, const double* m2, const double* m3, const int quad,
        const double* weight, const double* triaArea, const double* rPlus, const double* rMinus, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
  solveZM0(outReal, edgeLengths, triaPlus, triaMinus, scale,
        p1, p2, p3, x, y, z, u, v, w, s1, s2, s3, m1, m2, m3,
        quad, weight, triaArea, rPlus, rMinus, xMin, xMax, yMin, yMax, outputSize);
}