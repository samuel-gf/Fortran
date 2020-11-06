program teorema_del_seno
    ! Muestra la tabla de seno, coseno y tangente para ángulos desde 0º a 180º
    ! La construye a razón de fila por segundo
    use iso_fortran_env
    implicit none

    ! Variables reales
    real(real64), parameter:: pi = 4*atan(1.0_real64), a=4, b=6, a_c=pi/6
    real(real64):: a_a, a_b, angulo

    ! Variables enteras
    integer, parameter:: iteraciones = 180
    integer:: i, angulo_d   ! Ángulo en grados


    write (*, "(a)")     " ---------------------------------------"
    write (*, "(a)")     " ÁNGULO       SENO     COSENO   TANGENTE"
    write (*, "(a)")     " ---------------------------------------"
    do i = 1, iteraciones
        angulo = (pi)/iteraciones*i
        angulo_d = int(180/iteraciones*i)
        write (*, "(i6,1a,3f11.4)") angulo_d, "º", sin(angulo), cos(angulo), tan(angulo)
        call sleep(1)
    end do
    write (*, "(a)")     " ---------------------------------------"
end program teorema_del_seno
