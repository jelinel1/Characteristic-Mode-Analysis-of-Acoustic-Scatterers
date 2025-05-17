#pragma once
#ifndef CUDA_MATHEMATICAL_FUNCTIONS_H
#define CUDA_MATHEMATICAL_FUNCTIONS_H

struct MathematicalFunc {
   template <typename T>
   static T cudaCos(T);
   
   template <typename T>
   static T cudaSin(T);

   template <typename T>
   static T cudaSqrt(T);

   template <typename T>
   static T cudaLog(T); // natural logarithm
           
   template <typename T>
   static T cudaAbs(T);

   template <typename T>
   static T cudaAtan(T);
};

template <typename T>
T MathematicalFunc::cudaCos(T) {
   extern __device__ void error(void);
   error(); // Ensure that we won't compile any un-specialized types
   return NULL;
}

template <typename T>
T MathematicalFunc::cudaSin(T) {
   extern __device__ void error(void);
   error(); // Ensure that we won't compile any un-specialized types
   return NULL;
}

template <typename T>
T MathematicalFunc::cudaSqrt(T) {
   extern __device__ void error(void);
   error(); // Ensure that we won't compile any un-specialized types
   return NULL;
}

template <typename T>
T MathematicalFunc::cudaLog(T) {
   extern __device__ void error(void);
   error(); // Ensure that we won't compile any un-specialized types
   return NULL;
}

template <typename T>
T MathematicalFunc::cudaAbs(T) {
   extern __device__ void error(void);
   error(); // Ensure that we won't compile any un-specialized types
   return NULL;
}

template <typename T>
T MathematicalFunc::cudaAtan(T) {
   extern __device__ void error(void);
   error(); // Ensure that we won't compile any un-specialized types
   return NULL;
}

template <>
__device__ inline float MathematicalFunc::cudaCos(float value) {
  return cosf(value);
}

template <>
__device__ inline double MathematicalFunc::cudaCos(double value) {
  return cos(value);
}

template <>
__device__ inline float MathematicalFunc::cudaSin(float value) {
  return sinf(value);
}

template <>
__device__ inline double MathematicalFunc::cudaSin(double value) {
  return sin(value);
}

template <>
__device__ inline float MathematicalFunc::cudaSqrt(float value) {
  return sqrtf(value);
}

template <>
__device__ inline double MathematicalFunc::cudaSqrt(double value) {
  return sqrt(value);
}

template <>
__device__ inline float MathematicalFunc::cudaLog(float value) {
  return logf(value);
}

template <>
__device__ inline double MathematicalFunc::cudaLog(double value) {
  return log(value);
}

template <>
__device__ inline float MathematicalFunc::cudaAbs(float value) {
  return fabsf(value);
}

template <>
__device__ inline double MathematicalFunc::cudaAbs(double value) {
  return fabs(value);
}

template <>
__device__ inline float MathematicalFunc::cudaAtan(float value) {
  return atanf(value);
}

template <>
__device__ inline double MathematicalFunc::cudaAtan(double value) {
  return atan(value);
}
#endif // !CUDA_MATHEMATICAL_FUNCTIONS_H