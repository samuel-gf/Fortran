! Nunca llegó a funcionar porque no encuentro el valor que corresponde a dz
program integral_compleja
    use iso_fortran_env
    implicit none

    complex:: z, s, n, dz
    real:: t, dt

    t = 0
    s = 0
    dt = sqrt(2.)/10

    do while (t<=sqrt(2.))
        z = cmplx(t, t)                  ! Camino
        ! s = s + f(z) * dz
        t = t + dt
        write (*,*) t, " ", f(z), " ", s
    end do




contains

    complex function f(z) result(res)
        implicit none
        complex, intent(in):: z

        res = z**2
    end function


end program integral_compleja
