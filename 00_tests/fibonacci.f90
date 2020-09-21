program to_file
    implicit none
    integer(kind=16):: a(2), aux
    integer:: i ! Bucle
    
    ! Setup
    a = 1
    
    ! Process
    open (unit=1, file="data/fibonacci.txt")
    do i = 1, 180
        write (1, *) a(1)
        aux = a(1) + a(2)
        a(1) = a(2)
        a(2) = aux
    end do
    write (1, *) a(2)
    close(1)

    print *, "Datos escritos en data/fibonacci.txt"



end program to_file
