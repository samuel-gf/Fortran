module mod_dados
    use iso_fortran_env
    implicit none

contains

    integer function rnd(desde, hasta) result(ans)
        integer, intent(in):: desde, hasta
        real:: r

        call random_number(r)
        ans = int(r*(hasta-desde+1))+desde
    end function rnd



    subroutine init_factorial(limite, factorial)
        ! Genera un vector con los resultados del factorial
        implicit none
        integer, intent(in):: limite
        real(real128), intent(out), allocatable:: factorial(:)
        integer:: i

        allocate(factorial(limite))
        factorial(1) = 1
        genera_factorial: do i = 2, limite
            factorial(i) = factorial(i-1) * i
        end do genera_factorial
    end subroutine init_factorial

end module mod_dados

