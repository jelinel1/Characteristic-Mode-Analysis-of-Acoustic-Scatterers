template <typename T>
__device__ void transpose(T * outMat, const int numBasisFcns) {
  size_t const x = blockDim.x * blockIdx.x + threadIdx.x;
  size_t const y = blockDim.y * blockIdx.y + threadIdx.y;

  if(x >= numBasisFcns || y >= numBasisFcns) {
    return;
  }
   
  if(x > y) {
    outMat[x*numBasisFcns + y] = outMat[y*numBasisFcns + x];
  } 
}

__global__ void transposef(float * outMat, const int numBasisFcns) {
   transpose(outMat, numBasisFcns);
}

__global__ void transposed(double * outMat, const int numBasisFcns) {
   transpose(outMat, numBasisFcns);
}