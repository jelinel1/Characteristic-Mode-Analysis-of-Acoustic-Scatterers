#include "../../../../+utilities/+gpu/cuda/helpers.cu"

const double PI = 3.141592653589793238463;

template <typename T>
__device__ void triatriaDynamicGreen(T* outReal, T* outImag,
        const T* x, const T* y, const T* z, const T k,
        const T* weights, const T* triArea, const int quad,
        const int xMin, const int xMax,
        const int yMin, const int yMax, const int outputSize) {
  size_t const m = blockDim.x * blockIdx.x + threadIdx.x + (xMin * quad);
  size_t const n = blockDim.y * blockIdx.y + threadIdx.y + (yMin * quad);

  if(m >= xMax * quad || n >= yMax * quad) {
     return;
  }

  size_t const mTria = floorf(n / quad);
  size_t const nTria = floorf(m / quad);

  // stop condition - compute only half of the symetric matrix 
  if(mTria > nTria) {
     return;
  }

  size_t const mQuad = n % quad;
  size_t const nQuad = m % quad;

  const int dim = 3;
  T v1[dim], v2[dim];

  v1[0] = x[mTria*quad + mQuad];
  v1[1] = y[mTria*quad + mQuad];
  v1[2] = z[mTria*quad + mQuad];

  v2[0] = x[nTria*quad + nQuad];
  v2[1] = y[nTria*quad + nQuad];
  v2[2] = z[nTria*quad + nQuad];

  T kR = computeDist(v1, v2) * k;

  T resultReal, resultImag;
  if(kR < 1e-5) {
     resultReal = -kR / 2;
     resultImag = -1 + kR*kR / 6;
  } else {
     resultReal = (MathematicalFunc::cudaCos(kR) - 1) / kR;
     resultImag = - MathematicalFunc::cudaSin(kR) / kR;
  }

  T pi = PI;
  saveData(outReal, outImag, resultReal, resultImag,
           outputSize, mTria - yMin, nTria - xMin, quad,
           k * weights[mQuad] * weights[nQuad]
             * ((triArea[mTria] * triArea[nTria]) / pi));
}

__global__ void triatriaDynamicGreenf(float* outReal, float* outImag,
        const float* x, const float* y, const float* z, const float k,
        const float* weights, const float* triArea, const int quad,
        const int xMin, const int xMax, const int yMin, const int yMax, const int outputSize) {
  triatriaDynamicGreen(outReal, outImag, x, y, z, k, weights, triArea,
          quad, xMin, xMax, yMin, yMax, outputSize);
}

__global__ void triatriaDynamicGreend(double* outReal, double* outImag,
        const double* x, const double* y, const double* z, const double k,
        const double* weights, const double* triArea, const int quad,
        const int xMin, const int xMax, const int yMin, const int yMax, const int outputSize) {
  triatriaDynamicGreen(outReal, outImag, x, y, z, k, weights, triArea,
          quad, xMin, xMax, yMin, yMax, outputSize);
}
