#include "atomicAddTemplate.cu"
#include "mathematicalFunctions.cu"

#ifndef HELPERS
#define HELPERS
template<typename T>
__device__ inline T computeDist(const T* vec1, const T* vec2) {
   return MathematicalFunc::cudaSqrt((vec2[0] - vec1[0]) * (vec2[0] - vec1[0])
                   + (vec2[1] - vec1[1]) * (vec2[1] - vec1[1])
                   + (vec2[2] - vec1[2]) * (vec2[2] - vec1[2]));
}

template<typename T>
__device__ inline T dotProduct3(const T* vec1, const T* vec2) {
   return vec1[0]*vec2[0] + vec1[1]*vec2[1] + vec1[2]*vec2[2];
}

template<typename T>
__device__ inline T dotProduct3Static(const T vec1[], const T* vec2) {
   return vec1[0]*vec2[0] + vec1[1]*vec2[1] + vec1[2]*vec2[2];
}

template<typename T>
__device__ inline void vectorMinus3(T result[], const T* vec1, const T vec2[]) {
   result[0] = vec1[0] - vec2[0];
   result[1] = vec1[1] - vec2[1];
   result[2] = vec1[2] - vec2[2];
}

template<typename T>
__device__ inline T hypot(const T val1, const T val2) {
   return MathematicalFunc::cudaSqrt(val1*val1 + val2*val2);
}

template<typename T>
__device__ inline T norm2(const T vec[]) {
   return MathematicalFunc::cudaSqrt(vec[0]*vec[0] + vec[1]*vec[1] + vec[2]*vec[2]);
}

template<typename T>
__device__ inline void positiveXY(const T exponent, const T weight,
                                  T &resultReal, T &resultImag) {                           
   resultReal += weight*MathematicalFunc::cudaCos(exponent);
   resultImag += weight*MathematicalFunc::cudaSin(exponent);
}

template<typename T>
__device__ inline void negativeXY(const T exponent, const T weight,
                                  T &resultReal, T &resultImag) {
   resultReal -= weight*MathematicalFunc::cudaCos(exponent);
   resultImag -= weight*MathematicalFunc::cudaSin(exponent);
}

template<typename T>
__device__ inline void positiveXYDivided(const T exponent, const T weight,
        T &resultReal, T &resultImag, const T dist, const T wavelength) {
  if(dist == 0) {
    resultImag -= weight * wavelength;
  } else {
    resultReal += weight*(MathematicalFunc::cudaCos(exponent) - 1)/dist;
    resultImag += weight*MathematicalFunc::cudaSin(exponent)/dist;
  }
}

template<typename T>
__device__ inline void negativeXYDivided(const T exponent, const T weight,
        T &resultReal, T &resultImag, const T dist, const T wavelength) {
  if(dist == 0) {
    resultImag += weight * wavelength;
  } else {
    resultReal -= weight*(MathematicalFunc::cudaCos(exponent) - 1)/dist;
    resultImag -= weight*MathematicalFunc::cudaSin(exponent)/dist;
  }
}

template<typename T>
__device__ inline T RWGl10(const T sn, const T sp, const T Rn, const T Rp) {
  T sgn = sp < 0 ? -1 : 1;
  return sgn*MathematicalFunc::cudaLog((sp + sgn*Rp) / (sn + sgn*Rn)); 
}

template<typename T>
__device__ inline T RWG111(const T sn, const T sp, const T R0, const T Rn, const T Rp, const T I) {
   return 0.5 * (sp*Rp - sn*Rn + R0*R0*I);
}

template<typename T>
__device__ inline T RWGs00(const T sn, const T sp, const T t0, const T w0, const T R0, const T Rn, const T Rp) {
   if(MathematicalFunc::cudaAbs(t0) < 1e-16) {
      return 0;
   } else {
      T absW0 = MathematicalFunc::cudaAbs(w0);
      T R02 = R0*R0;
      return MathematicalFunc::cudaAtan(t0*sp / (R02 + absW0*Rp)) - MathematicalFunc::cudaAtan(t0*sn / (R02 + absW0*Rn));
   }
}

// template<typename T>
// __device__ inline void saveData(T * outReal, T * outImag,
//         const T resultReal, const T resultImag, const int numBasis,
//         const size_t m, const size_t n, const size_t p, const size_t q,
//         const int quad, const size_t blockPos, const T multiplier,
//         T sSumsReal[], T sSumsImag[]) {
//   if(quad == 1) {
//     outReal[m*numBasis + n] = resultReal * multiplier;
//     outImag[m*numBasis + n] = resultImag * multiplier;
// // TODO
// //   } else if(quad == 4) {
// //     __syncthreads();
// //     if(p < 2) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + 2];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + 2];
// //     }
// //     __syncthreads();
// //     if(p == 0) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + 1];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + 1];
// //     }
// //     __syncthreads();
// //     if(q < 2) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + (2*blockDim.x)];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + (2*blockDim.x)];
// //     }
// //     __syncthreads();
// //     if(q == 0) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + blockDim.x];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + blockDim.x];
// //       if(p == 0) {
// //         outReal[m*numBasis + n] = sSumsReal[blockPos] * multiplier;
// //         outImag[m*numBasis + n] = sSumsImag[blockPos] * multiplier;
// //       }
// //     }
// //   } else if(quad == 16) {
// //     __syncthreads();
// //     if(p < 8) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + 8];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + 8];
// //     }
// //     __syncthreads();
// //     if(p < 4) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + 4];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + 4];
// //     }
// //     __syncthreads();
// //     if(p < 2) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + 2];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + 2];
// //     }
// //     __syncthreads();
// //     if(p == 0) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + 1];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + 1];
// //     }
// //     __syncthreads();
// //     if(q < 8) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + (8*blockDim.x)];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + (8*blockDim.x)];
// //     }
// //     __syncthreads();
// //     if(q < 4) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + (4*blockDim.x)];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + (4*blockDim.x)];
// //     }
// //     __syncthreads();
// //     if(q < 2) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + (2*blockDim.x)];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + (2*blockDim.x)];
// //     }
// //     __syncthreads();
// //     if(q == 0) {
// //       sSumsReal[blockPos] += sSumsReal[blockPos + blockDim.x];
// //       sSumsImag[blockPos] += sSumsImag[blockPos + blockDim.x];
// //       if(p == 0) {
// //         outReal[m*numBasis + n] = sSumsReal[blockPos] * multiplier;
// //         outImag[m*numBasis + n] = sSumsImag[blockPos] * multiplier;
// //       }
// //     }
//   } else {
//     CudaAtomicAdd<T> caa;    
//     caa.AtomicAdd(&outReal[m*numBasis + n], resultReal * multiplier);
//     caa.AtomicAdd(&outImag[m*numBasis + n], resultImag * multiplier);
//   }
// }

template<typename T>
__device__ inline void saveData(T * outReal, T * outImag,
        const T resultReal, const T resultImag, const int numBasis,
        const size_t m, const size_t n, const int quad, const T multiplier) {
  if(quad == 1) {
    outReal[m*numBasis + n] = resultReal * multiplier;
    outImag[m*numBasis + n] = resultImag * multiplier;
  } else {
    CudaAtomicAdd<T> caa;    
    caa.AtomicAdd(&outReal[m*numBasis + n], resultReal * multiplier);
    caa.AtomicAdd(&outImag[m*numBasis + n], resultImag * multiplier);
  }
}
#endif