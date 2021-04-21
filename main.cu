#include <cuda.h>

template<class Func> __global__ void invoke(Func func) { func(); }

int main() {
    int* a = nullptr;
    cudaMalloc(&a, sizeof(int));
    invoke<<<1, 1>>>(
        [=] __device__ () {
            a[threadIdx.x] = 1;
        }
    );
}
