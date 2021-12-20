program sumatorio
    implicit none

    real:: s=0
    real, parameter:: q = 0.71
    integer, parameter:: n=10
    integer:: i

    do i = 0, n-1
        s = s + q**i 
        write (*,*) i, s
    end do

    s = s + q**n/(1-q)
    write (*,*) n, s


end program sumatorio
