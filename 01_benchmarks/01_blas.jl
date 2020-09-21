using Random
using LinearAlgebra.BLAS

const n = 5000

a = rand(Float64, (n,n))
b = rand(Float64, (n,n))
c = Array{Float64}(undef, n, n)

BLAS.gemm!('n', 'n', 1.0, a, b, 0.0, c)
