program barajas
    use iso_fortran_env
    implicit none

    real(real128):: a(80), sol
    real(real128), parameter:: denominador = 2.0d0**40
    integer:: i

    a(1) = 1
    do i = 2, 80
        a(i) = a(i-1) * i
        !print *, a(i)
    end do

    sol = a(80) / denominador
    print *, sol


end program barajas
