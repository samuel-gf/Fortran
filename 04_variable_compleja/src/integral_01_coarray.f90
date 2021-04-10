program Integral_01_coarray
! Calcular $\int_{\gamma=\{|z|=1\}} \frac{Ln z}{z} dz$
! SOLUCIÓN
! Para calular esta integral compleja debemos hallar el camino y la derivada de este a lo largo del
! contorno
!
! Camino: 					gamma(t)=e^{it}
! Derivada del camino:		gamma'(t)=ie^{it} dt
! Función:					f(gamma(t))=\frac{Ln e^{it}}{e^{it}}=\frac{it}{e^{it}}

    use iso_fortran_env
    implicit none

    real, parameter:: pi = 3.141592654
    real, parameter:: t_0=0, t_end=2*pi
    real(real64), parameter:: dt = 0.000001
    real(real64):: t[*]
    complex(real64):: s[*]                  ! Suma
    complex:: i = cmplx(0,1)

    ! Inicializar variables
    t = t_0 + dt * this_image()-1
    s = 0

    ! Cabecera
    if (this_image() == 1) then
        write (*, "(a25)") "------------------------"
        write (*,"(a8,a8,a9)") "Iter.", "Re", "Im"
        write (*, "(a25)") "------------------------"
    end if

    sync all

    ! Bucle principal
    do while (t <= t_end)
        s = s + f(t) * fp(t) * dt
        t = t + dt * num_images()
    end do
    sync all

    call co_sum(s)   
    if (this_image() == 1) then
        write (*,"(f8.2,f8.2, sp, f8.2, a1)") t, s%re, s%im, "i"
        write (*, "(a25)") "------------------------"
    end if





contains

    complex(real64) function f(t) result (res)
        ! Función a integrar: f(gamma(t))
        implicit none
        real(real64), intent(in):: t
        res = (i*t)/(exp(i*t))
    end function f


    complex(real64) function fp(t) result(res)
        ! Derivada del camino: gammma'(t)
        implicit none
        real(real64), intent(in):: t
        res = i * exp(i*t)
    end function fp

end program Integral_01_coarray
