program random_generator
    use iso_fortran_env
    implicit none

    integer, parameter:: MAX = 10
    integer:: i             ! Loop

    !$OMP do
    aleatorio: do i = 2, MAX
        write (*,"(f15.6)") rnd(i)
    end do aleatorio
    !$OMP end do

contains

    real(real64) function rnd(n) result(ans)
        integer:: n

        ans = real(n)
        ans = sqrt(real(106*n**2 + 94*n + 25))
        ans = ans - int(ans)
    end function

end program random_generator
