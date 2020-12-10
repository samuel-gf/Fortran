module factorial
use ISO_FORTRAN_ENV
implicit none

contains
    ! Devuelve el valor final
    real(real64) function fact(n)
        integer, intent(in):: n ! Number to compute
        integer:: i             ! Loop

        fact = 1.0
        do i = 2, n
            fact = fact * i
        end do
    end function 

    ! Devuelve un vector con los factoriales
    subroutine factorial_vector(n, a)
        integer, intent(in):: n
        real(real64), intent(out):: a(n)
        integer:: i
        
        a = 0
        a(1) = 1
        do i = 2, n
            a(i) = a(i-1) * i
        end do
    end subroutine

    subroutine factorial_vector_parallel(n, a)
        integer, intent(in):: n
        real(real64), intent(out):: a(n)
        integer:: i
        
        a = 0
        a(1) = 1
        do i = 2, n
            a(i) = a(i-1) * i
        end do
    end subroutine

end module factorial
