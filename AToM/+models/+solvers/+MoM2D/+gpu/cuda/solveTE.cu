#include "../../../../+utilities/+gpu/cuda/helpers.cu"

template <typename T>
__device__ void solveTE(T * outReal, T * outImag, const T * weights,
        const T * radiusVectors, const T wavelength,
        const int quad, const T* edgeLengths, const T scale, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
           
  size_t const x = blockDim.x * blockIdx.x + threadIdx.x + (xMin * quad);
  size_t const y = blockDim.y * blockIdx.y + threadIdx.y + (yMin * quad);

  if(x >= xMax * quad || y >= yMax * quad) {
     return;
  }

  size_t const m = floorf(x/quad);
  size_t const n = floorf(y/quad);

  // stop condition - compute only half of the symetric matrix
  if(m > n) {
     return;
  }

//   __shared__ T sSumsReal[1024];
//   __shared__ T sSumsImag[1024];
//   size_t const blockPos = threadIdx.y*blockDim.x + threadIdx.x;

  size_t const p = x % quad;
  size_t const q = y % quad;

  const T weight = weights[p*quad + q];

  const T* radius1 = &radiusVectors[m*quad*2*3]; // m-th radius function, each represented by 2*quad points, each point in 3D system
  const T* radius2 = &radiusVectors[n*quad*2*3];

  T resultReal = 0, resultImag = 0, dist;

  dist = computeDist(&radius1[q*3], &radius2[p*3]);
  positiveXY(-wavelength*dist, weight, resultReal, resultImag);

  dist = computeDist(&radius1[(q+quad)*3], &radius2[p*3]);
  negativeXY(-wavelength*dist, weight, resultReal, resultImag);

  dist = computeDist(&radius1[q*3], &radius2[(p+quad)*3]);
  negativeXY(-wavelength*dist, weight, resultReal, resultImag);

  dist = computeDist(&radius1[(q+quad)*3], &radius2[(p+quad)*3]);
  positiveXY(-wavelength*dist, weight, resultReal, resultImag);

//   sSumsReal[blockPos] = resultReal;
//   sSumsImag[blockPos] = resultImag;

  const T multiplier = (edgeLengths[m] * edgeLengths[n]) / scale;
//   saveData(outReal, outImag, resultReal, resultImag, outputSize, m, n, p, q,
//            quad, blockPos, multiplier, sSumsReal, sSumsImag);
  saveData(outReal, outImag, resultReal, resultImag, outputSize,
           m - xMin, n - yMin, quad, multiplier);
}

__global__ void solveTEf(float * outReal, float * outImag, const float * weights,
        const float * radiusVectors, const float wavelength, const int quad,
        const float* edgeLengths, const float scale, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
  solveTE(outReal, outImag, weights, radiusVectors, wavelength,
          quad, edgeLengths, scale, xMin, xMax, yMin, yMax, outputSize);
}

__global__ void solveTEd(double * outReal, double * outImag, const double * weights,
        const double * radiusVectors, const double wavelength, const int quad,
        const double* edgeLengths, const double scale, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
  solveTE(outReal, outImag, weights, radiusVectors, wavelength,
          quad, edgeLengths, scale, xMin, xMax, yMin, yMax, outputSize);
}
