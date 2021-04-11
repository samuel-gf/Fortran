program Integral_01
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
    real(real64), parameter:: dt = 0.0000001
    real(real64):: t
    complex(real64):: suma
    complex:: i = cmplx(0,1)

    ! Inicializar variables
    t = t_0
	suma = 0

    ! Cabecera
    write (*, "(a25)") "------------------------"
    write (*,"(a8,a8,a9)") "Iter.", "Re", "Im"
    write (*, "(a25)") "------------------------"
    do while (t <= t_end)
        suma = suma + f(t) * fp(t) * dt
        write (*,"(a11,f8.2, sp, f8.2, a1)") "Resultado: ", suma%re, suma%im, "i"
        t = t + dt
    end do

    ! Mostrar resultados
    write (*,"(a11,f8.2, sp, f8.2, a1)") "Resultado: ", suma%re, suma%im, "i"
    write (*, "(a25)") "------------------------"




contains

    complex(real64) function f(t) result (res)
        ! Función a integrar en función de t
        implicit none
        real(real64), intent(in):: t
        res = (i*t)/(exp(i*t))
    end function f


    complex(real64) function fp(t) result(res)
        ! Derivada del camino en función de t
        implicit none
        real(real64), intent(in):: t
        res = i * exp(i*t)
    end function fp

end program Integral_01
