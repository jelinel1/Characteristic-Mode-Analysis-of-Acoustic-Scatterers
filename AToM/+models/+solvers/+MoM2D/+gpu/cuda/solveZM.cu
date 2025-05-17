#include "../../../../+utilities/+gpu/cuda/helpers.cu"

template <typename T>
__device__ void solveZM(T * outReal, T * outImag, const T * weights,
        const T * radiusVectors, const T * basisVectors, const T wavelength,
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

  T weight = weights[p*quad + q];

  const T* radius1 = &radiusVectors[m*quad*2*3]; // m-th radius function, each represented by 2*quad points, each point in 3D system
  const T* radius2 = &radiusVectors[n*quad*2*3];

  const T* basis1 = &basisVectors[m*quad*2*3];
  const T* basis2 = &basisVectors[n*quad*2*3];

  T resultReal = 0, resultImag = 0, dist, basisDotProduct;

  dist = computeDist(&radius1[q*3], &radius2[p*3]);
  basisDotProduct = dotProduct3(&basis1[q*3], &basis2[p*3]);
  positiveXYDivided(-wavelength*dist, weight*basisDotProduct, resultReal,
                     resultImag, dist, wavelength);

  dist = computeDist(&radius1[(q+quad)*3], &radius2[p*3]);
  basisDotProduct = dotProduct3(&basis1[(q+quad)*3], &basis2[p*3]);
  negativeXYDivided(-wavelength*dist, weight*basisDotProduct, resultReal,
                     resultImag, dist, wavelength);

  dist = computeDist(&radius1[q*3], &radius2[(p+quad)*3]);
  basisDotProduct = dotProduct3(&basis1[q*3], &basis2[(p+quad)*3]);
  negativeXYDivided(-wavelength*dist, weight*basisDotProduct, resultReal,
                     resultImag, dist, wavelength);

  dist = computeDist(&radius1[(q+quad)*3], &radius2[(p+quad)*3]);
  basisDotProduct = dotProduct3(&basis1[(q+quad)*3], &basis2[(p+quad)*3]);
  positiveXYDivided(-wavelength*dist, weight*basisDotProduct, resultReal,
                     resultImag, dist, wavelength);

//   sSumsReal[blockPos] = resultReal;
//   sSumsImag[blockPos] = resultImag;

  const T multiplier = (edgeLengths[m] * edgeLengths[n]) / scale;
//   saveData(outReal, outImag, resultReal, resultImag, numBasisFcns, m, n, p, q,
//            quad, blockPos, multiplier, sSumsReal, sSumsImag);
  saveData(outReal, outImag, resultReal, resultImag, outputSize,
           m - xMin, n - yMin, quad, multiplier);
}

__global__ void solveZMf(float * outReal, float * outImag, const float * weights,
        const float * radiusVectors, const float * basisVectors, const float wavelength,
        const int quad, const float* edgeLengths, const float scale, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
  solveZM(outReal, outImag, weights, radiusVectors, basisVectors, wavelength,
          quad, edgeLengths, scale, xMin, xMax, yMin, yMax, outputSize);
}

__global__ void solveZMd(double * outReal, double * outImag, const double * weights,
        const double * radiusVectors, const double * basisVectors, const double wavelength,
        const int quad, const double* edgeLengths, const double scale, const int xMin,
        const int xMax, const int yMin, const int yMax, const int outputSize) {
  solveZM(outReal, outImag, weights, radiusVectors, basisVectors, wavelength,
          quad, edgeLengths, scale, xMin, xMax, yMin, yMax, outputSize);
}