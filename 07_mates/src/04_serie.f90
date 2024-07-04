program serie
    use iso_fortran_env
    implicit none

    integer :: n                                           ! Índice de la serie
    real :: a_n, S                                         ! Término y suma 
    real, parameter:: x = 0.9

    S = 0

    ! Cabecera
    write (*, "(a4, 2a20)") "n", "a_n", "Suma"

    ! Bucle principal
    do n = 1, 20
        a_n = (1.0/n) * (x/2)**n
        S = S + a_n
        write (*, "(i4, 2f20.8)") n, a_n, S
    end do


end program serie

