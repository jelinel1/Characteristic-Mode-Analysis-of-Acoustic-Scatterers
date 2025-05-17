#include "../../../../+utilities/+gpu/cuda/helpers.cu"
#include "../../../+MoM2D/+gpu/cuda/ITT.cu"

template <typename T>
__device__ void triatriaStaticGreen(T* outReal, const T* p1,
        const T* p2, const T* p3, const T* x, const T* y, const T* z,
        const T* u, const T* v, const T* w, const T* s1, const T* s2, const T* s3,
        const T* m1, const T* m2, const T* m3, const T* weights, 
        const T* triArea, const int quad, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputDim) {
           
  size_t const m = blockDim.x * blockIdx.x + threadIdx.x + (xMin * quad);
  size_t const n = blockDim.y * blockIdx.y + threadIdx.y + yMin;

  if(m >= xMax * quad || n >= yMax) {
     return;
  }

  size_t const mTria = n;
  size_t const nTria = floorf(m / quad);
  size_t const nQuad = m % quad;

  const int dim = 3;
  T result = ITT3(&p1[mTria*dim], &p2[mTria*dim], &p3[mTria*dim],
          x[nTria*quad + nQuad], y[nTria*quad + nQuad], z[nTria*quad + nQuad],
          &w[mTria*dim], &s1[mTria*dim], &s2[mTria*dim], &s3[mTria*dim],
          &m1[mTria*dim], &m2[mTria*dim], &m3[mTria*dim], weights[nQuad]);

  CudaAtomicAdd<T> caa;    
  caa.AtomicAdd(&outReal[(mTria - yMin)*outputDim + (nTria - xMin)],
          result * triArea[nTria]);
}

__global__ void triatriaStaticGreenf(float* outReal, const float* p1,
        const float* p2, const float* p3, const float* x, const float* y, const float* z,
        const float* u, const float* v, const float* w, const float* s1, const float* s2, const float* s3,
        const float* m1, const float* m2, const float* m3, const float* weights,
        const float* triArea, const int quad,
        const int xMin, const int xMax, const int yMin, const int yMax, const int outputDim) {
  triatriaStaticGreen(outReal, p1, p2, p3, x, y, z, u, v, w, s1, s2, s3,
        m1, m2, m3, weights, triArea, quad, xMin, xMax, yMin, yMax, outputDim);
}

__global__ void triatriaStaticGreend(double* outReal, const double* p1,
        const double* p2, const double* p3, const double* x, const double* y, const double* z,
        const double* u, const double* v, const double* w, const double* s1, const double* s2, const double* s3,
        const double* m1, const double* m2, const double* m3, const double* weights,
        const double* triArea, const int quad,
        const int xMin, const int xMax, const int yMin, const int yMax, const int outputDim) {
  triatriaStaticGreen(outReal, p1, p2, p3, x, y, z, u, v, w, s1, s2, s3,
        m1, m2, m3, weights, triArea, quad, xMin, xMax, yMin, yMax, outputDim);
}
