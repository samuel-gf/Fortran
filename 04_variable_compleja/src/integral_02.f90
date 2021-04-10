program Integral_02
! Calcular $f(x)=z^2$
! SOLUCIÓN
! Para calular esta integral compleja debemos hallar el camino y la derivada de este a lo largo del
! contorno
!
! Camino: 					gamma(t)=t+it,   para 0<=t<=1
! Derivada del camino:		gamma'(t)=1+i
! Función:					f(gamma(t))=(t+it)^2=2it^2

    implicit none
    real, parameter:: pi = 3.141592654
    real, parameter:: t_0=0, t_end=1
    real, parameter:: dt = 0.001
    real:: t
    complex:: s                 ! Suma
    complex:: i = cmplx(0,1)

    ! Inicializar variables
    t = t_0
    s = cmplx(0,0)

    ! Bucle de la integral
    write (*, "(a25)") "------------------------"
    write (*,"(a8,a8,a9)") "Iter.", "Re", "Im"
    write (*, "(a25)") "------------------------"
    do while (t <= t_end)
        s = s + f(t) * fp(t) * dt
        write (*,"(f8.2,f8.2, sp, f8.2, a1)") t, s%re, s%im, "i"
        t = t + dt
    end do
    write (*, "(a25)") "------------------------"




contains

    complex function f(t) result (res)
        ! Función a integrar: f(gamma(t))
        implicit none
        real, intent(in):: t
        res = 2*i*t**2
    end function f


    complex function fp(t) result(res)
        ! Derivada del camino: gammma'(t)
        implicit none
        real, intent(in):: t
        res = 1+i
    end function fp

end program Integral_02
