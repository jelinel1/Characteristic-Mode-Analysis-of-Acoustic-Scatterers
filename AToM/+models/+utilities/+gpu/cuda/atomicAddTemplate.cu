#pragma once
#ifndef CUDA_ATOMIC_ADD_TEMPLATE_H
#define CUDA_ATOMIC_ADD_TEMPLATE_H

template <typename T>
struct CudaAtomicAdd
{
	__device__ T AtomicAdd(T* ref, T value)
	{
		extern __device__ void error(void);
		error(); // Ensure that we won't compile any un-specialized types
		return NULL;
	}
};
template <>
struct CudaAtomicAdd <int>
{
	__device__ unsigned int AtomicAdd(int* ref, int value)
	{
		return atomicAdd(ref, value);
	}
};
template <>
struct CudaAtomicAdd <unsigned int>
{
	__device__ unsigned int AtomicAdd(unsigned int* ref, unsigned int value)
	{
		return atomicAdd(ref, value);
	}
};
template <>
struct CudaAtomicAdd <unsigned long long int>
{
	__device__ unsigned int AtomicAdd(unsigned long long int* ref, unsigned long long int value)
	{
		return atomicAdd(ref, value);
	}
};
template <>
struct CudaAtomicAdd <float>
{
	__device__ float AtomicAdd(float* ref, float value)
	{
		return atomicAdd(ref, value);
	}
};
template <>
struct CudaAtomicAdd <double>
{
	__device__ double AtomicAdd(double* ref, double value)
	{
    	// double is different becase it is only supported in later architectures
	#if __CUDA_ARCH__ < 600
		unsigned long long int* address_as_ull = (unsigned long long int*)ref;
		unsigned long long int old = *address_as_ull, assumed;
		do {
			assumed = old;
			old = atomicCAS(address_as_ull, 
    			    assumed,
    			    __double_as_longlong(
    			        value + __longlong_as_double(assumed)
    			    )
    			);
		} while (assumed != old);
		return __longlong_as_double(old);
	#else
		return atomicAdd(ref, value);
	#endif
	}
};
#endif // !CUDA_ATOMIC_ADD_TEMPLATE_H