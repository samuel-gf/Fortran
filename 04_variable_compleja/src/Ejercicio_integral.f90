program Ejercicio_integral
! Calcular $\int_{\gamma=\{|z|=1\}} \frac{Ln z}{z} dz$
! SOLUCIÓN
! Para calular esta integral compleja debemos hallar el camino y la derivada de este a lo largo del
! contorno
!
! Camino: 					gamma(t)=e^{it}
! Derivada del camino:		gamma'(t)=ie^{it} dt
! Función:					f(gamma(t))=\frac{Ln e^{it}}{e^{it}}=\frac{it}{e^{it}}

    implicit none
    real, parameter:: pi = 3.141592654
    real, parameter:: t_0=0, t_end=2*pi
    real, parameter:: dt = 0.001
    real:: t
    complex:: s                 ! Suma
    complex:: i = cmplx(0,1)

    ! Inicializar variables
    t = t_0
    s = cmplx(0,0)

    ! Bucle de la integral
    do while (t <= t_end)
        s = s + f(t) * fp(t) * dt
        t = t + dt
    end do

    ! Mostrar resultados
    write (*,*) "Resultado", s




contains

    complex function f(t) result (res)
        ! Función a integrar
        implicit none
        real, intent(in):: t
        res = (i*t)/(exp(i*t))
    end function f


    complex function fp(t) result(res)
        ! Derivada de la función a integrar
        implicit none
        real, intent(in):: t
        res = i * exp(i*t)
    end function fp

end program Ejercicio_integral
