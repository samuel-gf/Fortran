program julia
    implicit none

    integer, parameter:: n= 1000

    real(kind=8):: a(n,n), b(n,n), c(n,n)

    call random_seed()
    call random_number(a)
    call random_number(b)

    call dgemm( "n", "n", n, n, n, 1.d0, a, n, b, n, 0.d0, c, n)

end program julia
