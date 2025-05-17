template <typename T>
__device__ void symmetrize(T * outMat, const int numBasisFcns) {
  size_t const x = blockDim.x * blockIdx.x + threadIdx.x;
  size_t const y = blockDim.y * blockIdx.y + threadIdx.y;

  if(x >= numBasisFcns || y >= numBasisFcns) {
    return;
  }
   
  if(x > y) {
    T tmp = (outMat[x*numBasisFcns + y] + outMat[y*numBasisFcns + x])/2;
    outMat[x*numBasisFcns + y] = tmp;
    outMat[y*numBasisFcns + x] = tmp;
  }
}

__global__ void symmetrizef(float * outMat, const int numBasisFcns) {
   symmetrize(outMat, numBasisFcns);
}

__global__ void symmetrized(double * outMat, const int numBasisFcns) {
   symmetrize(outMat, numBasisFcns);
}