program factorial
        
    use iso_fortran_env 
    real(real128):: f(1000), d
    integer:: i

    f(1) = 1
    crea_factorial: do i = 2, 1000
       f(i) = f(i-1) * i
    end do crea_factorial
    
    d = f(1000)/(f(115)*f(1000-115))
    d = d * 0.1d0**115 * 0.9d0**885
    print *, d


end program factorial
