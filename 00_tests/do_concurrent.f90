program do_concurrent
    implicit none

    integer, parameter:: n = 1000000, n2 = 10
    integer:: i, j
    real:: x(n), t(0:3)
    real:: r

    x = 3.14
    call cpu_time(t(0))
    do concurrent (i = 1:n)
        do j = 1, n2
            x(i) = x(i) * gamma(real(i)/i+1)
        end do
    end do
    call cpu_time(t(1))

    x = 3.14
    call cpu_time(t(2))
    do i = 1, n
        do j= 1, n2
            x(i) = x(i) * gamma(real(i)/i+1)
        end do
    end do
    call cpu_time(t(3))

    print "(a,f10.8)", "Concurrent time ", t(3)-t(2)
    print "(a,f10.8)", "Non parallel time ", t(1)-t(0)

end program do_concurrent
