program funcion1
    integer, parameter:: max=40
    real:: x(max), y(max)
    integer:: i     ! do loop

    ! Generar datos
    do i = 1, max
        x(i) = i
        y(i) = exp(real(i))
    end do

    ! Escribir en disco
    open(unit=10, file="data/funcion1.dat", status="replace", action="write")
    do i = 1, max
        write (10, *) x(i), y(i)
    end do
    close(10)
end program funcion1
