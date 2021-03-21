program indepe
    use iso_fortran_env
    use mod_dados
    implicit none

    integer, parameter:: max_i = 1000
    real:: s    ! suma
    real, parameter:: p = 0.3, q = 1-p
    real(real128), allocatable:: f(:)

    integer:: i, j, k, n

    ! SETUP ---------------------
    s = 0
    call init_factorial(100, f)
    print *, p, q

    ! ALGORITMO ----------------
    acuden: do k = 1, max_i
        ingresan: do n= 1, i
            s = s + f(k)*(f(n)*f(k-n)) * p**n * q**(k-n)
        end do ingresan
    end do acuden

    ! RESULTADOS ------------------
    print *, s
end program indepe
