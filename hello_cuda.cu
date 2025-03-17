#include <stdio.h>

__global__ void hello_cuda() {
    printf("Hello from CUDA Kernel!\n");
	printf("Thread ID: %d\n", threadIdx.x);
	printf("Block ID: %d\n", blockIdx.x);
	printf("Block Dim: %d\n", blockDim.x);
	printf("Grid Dim: %d\n", gridDim.x);
}

int main() {
    hello_cuda<<<1, 1>>>();
    cudaDeviceSynchronize();  // Wait for the kernel to finish

    return 0;
}


// Compile with: nvcc -o hello_cuda hello_cuda.cu
// Run with: ./hello_cuda
// Output:
// Hello from CUDA Kernel!
// Thread ID: 0
// Block ID: 0
// Block Dim: 1
// Grid Dim: 1