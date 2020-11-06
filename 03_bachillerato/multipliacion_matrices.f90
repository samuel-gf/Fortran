program multiplicacion_matrices
    integer:: a(3, 3), b(3, 3), c(3, 3)
    integer:: i

    ! Leer las matrices
    open(unit = 1, file="matriz1.txt")
    read (1, *) a, b
    close(1)
    c = 0

    ! Operar
    c(1, 1) = a(1, 1)*b(1, 1) + a(1, 2)*b(2, 1) + a(1, 3)*b(3, 1)
    ! ...

    ! Mostrar los resultados
    do i = 1, 3
        write (*, "(3i4)") a(i, :)
    end do

    print *, " "

    do i = 1, 3
        write (*, "(3i4)") b(i, :)
    end do

end program
