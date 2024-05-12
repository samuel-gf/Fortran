! Resuelve la ecuación exp(x)=x
program ecuacion
    use iso_fortran_env
    implicit none

    integer, parameter :: min = 0, max = 3
    real, parameter:: sigma = 0.0001
    real:: a, b, m

    a = min
    b = max

    do
        m = (a + b) / 2
        write (*,*) a, m, b, m*2**m-1
        !read (*,*) 
        if (m*2**m-1 .gt. 0) then
            b = m
        else
            a = m
        end if
        if (abs(m*2**m - 1) < sigma) then
            exit
        end if
    end do



end program ecuacion
