#include "../../../../+utilities/+gpu/cuda/helpers.cu"

template <typename T>
__device__ void ITT(T &ITT1, T &ITT2x, T &ITT2y, T &ITT2z, T &ITT3,
        const T * p1, const T * p2, const T * p3, const T x, const T y, const T z,
        const T * u, const T * v, const T * w,  const T * s1, const T * s2, const T * s3,
        const T * m1, const T * m2, const T * m3, const T weight, const T triaArea) {
  const int dim = 3;
  T R1[dim], R2[dim], R3[dim], quadCoord[dim], tmp[dim];

  quadCoord[0] = x;
  quadCoord[1] = y;
  quadCoord[2] = z;
  vectorMinus3(R1, p1, quadCoord);
  vectorMinus3(R2, p2, quadCoord);
  vectorMinus3(R3, p3, quadCoord);

  T t10 = dotProduct3Static(R2, m1);
  T t20 = dotProduct3Static(R3, m2);
  T t30 = dotProduct3Static(R1, m3);

  T ww = dotProduct3Static(R1, w);

  T R10 = hypot(t10, ww);
  T R20 = hypot(t20, ww);
  T R30 = hypot(t30, ww);

  T R1n = norm2(R2);
  T R1p = norm2(R3);
  T R2p = norm2(R1);

  T s1n = dotProduct3Static(R2, s1);
  T s1p = dotProduct3Static(R3, s1);
  T s2n = dotProduct3Static(R3, s2);
  T s2p = dotProduct3Static(R1, s2);
  T s3n = dotProduct3Static(R1, s3);
  T s3p = dotProduct3Static(R2, s3);
  T I11 = RWGl10(s1n, s1p, R1n, R1p);
  T I21 = RWGl10(s2n, s2p, R1p, R2p);
  T I31 = RWGl10(s3n, s3p, R2p, R1n);

  vectorMinus3(tmp, quadCoord, p1);
  T w0 = dotProduct3(tmp, w);

  T beta = 0;
  beta += RWGs00(s1n, s1p, t10, w0, R10, R1n, R1p);
  beta += RWGs00(s2n, s2p, t20, w0, R20, R1p, R2p);
  beta += RWGs00(s3n, s3p, t30, w0, R30, R2p, R1n);

  T S = t10*I11 + t20*I21 + t30*I31 - MathematicalFunc::cudaAbs(w0)*beta;

  T I12 = RWG111(s1n, s1p, R10, R1n, R1p, I11);
  T I22 = RWG111(s2n, s2p, R20, R1p, R2p, I21);
  T I32 = RWG111(s3n, s3p, R30, R2p, R1n, I31);

  T Su = dotProduct3(u, m1)*I12 + dotProduct3(u, m2)*I22 + dotProduct3(u, m3)*I32 + dotProduct3(tmp, u)*S;
  T Sv = dotProduct3(v, m1)*I12 + dotProduct3(v, m2)*I22 + dotProduct3(v, m3)*I32 + dotProduct3(tmp, v)*S;

  T ITT1tmp = quadCoord[0] * (Su*u[0] + Sv*v[0] + S*p1[0])
            + quadCoord[1] * (Su*u[1] + Sv*v[1] + S*p1[1])
            + quadCoord[2] * (Su*u[2] + Sv*v[2] + S*p1[2]);

  ITT1 += (2 * ITT1tmp * weight) / triaArea;
  ITT2x += (2 * S * weight * quadCoord[0]) / triaArea;
  ITT2y += (2 * S * weight * quadCoord[1]) / triaArea;
  ITT2z += (2 * S * weight * quadCoord[2]) / triaArea;
  ITT3 += (2 * S * weight) / triaArea;
}

template <typename T>
__device__ T ITT3(const T * p1, const T * p2, const T * p3, const T x, const T y, const T z,
        const T * w,  const T * s1, const T * s2, const T * s3,
        const T * m1, const T * m2, const T * m3, const T weight) {
  const int dim = 3;
  T R1[dim], R2[dim], R3[dim], quadCoord[dim], tmp[dim];

  quadCoord[0] = x;
  quadCoord[1] = y;
  quadCoord[2] = z;
  vectorMinus3(R1, p1, quadCoord);
  vectorMinus3(R2, p2, quadCoord);
  vectorMinus3(R3, p3, quadCoord);

  T t10 = dotProduct3Static(R2, m1);
  T t20 = dotProduct3Static(R3, m2);
  T t30 = dotProduct3Static(R1, m3);

  T ww = dotProduct3Static(R1, w);

  T R10 = hypot(t10, ww);
  T R20 = hypot(t20, ww);
  T R30 = hypot(t30, ww);

  T R1n = norm2(R2);
  T R1p = norm2(R3);
  T R2p = norm2(R1);

  T s1n = dotProduct3Static(R2, s1);
  T s1p = dotProduct3Static(R3, s1);
  T s2n = dotProduct3Static(R3, s2);
  T s2p = dotProduct3Static(R1, s2);
  T s3n = dotProduct3Static(R1, s3);
  T s3p = dotProduct3Static(R2, s3);
  T I11 = RWGl10(s1n, s1p, R1n, R1p);
  T I21 = RWGl10(s2n, s2p, R1p, R2p);
  T I31 = RWGl10(s3n, s3p, R2p, R1n);

  vectorMinus3(tmp, quadCoord, p1);
  T w0 = dotProduct3(tmp, w);

  T beta = 0;
  beta += RWGs00(s1n, s1p, t10, w0, R10, R1n, R1p);
  beta += RWGs00(s2n, s2p, t20, w0, R20, R1p, R2p);
  beta += RWGs00(s3n, s3p, t30, w0, R30, R2p, R1n);

  T S = t10*I11 + t20*I21 + t30*I31 - MathematicalFunc::cudaAbs(w0)*beta;
  return 2 * S * weight;
}