program serie
    use iso_fortran_env
    implicit none

    ! Sea 'N_s' es el número de series
    ! 'n' es el índice: 1, 2, 3, ...
    ! 'a_n' es cada uno de los términos
    ! 'S' es la suma de cada serie

    integer, parameter:: N_s = 4 
    integer :: n                
    integer :: i               
    real :: a_n(N_s), S(N_s)  
    real :: x(N_s) = [0.0, 0.5, 1.0, 2.0]


    ! Cabecera
    write (*, "(a1, 1a163)") " ", repeat("-", 164)
    write (*, "(a4)", advance="no") "n"
    do i = 1, N_s
        write (*, "(2(a15, f4.2, a1))", advance="no") "a_n (x=", x(i), ")", "Suma (x=", x(i), ")"
    end do
    write (*, *)
    write (*, "(a1, 1a163)") " ", repeat("-", 164)

    ! Bucle principal
    do n = 1, 40
        write (*, "(i4)", advance="no") n
        do i = 1, 4
            a_n(i) = termino(n, x(i))
            S(i) = S(i) + a_n(i)
            write (*, "(2f20.8)", advance="no") a_n(i), S(i)
        end do
        write (*, *)
    end do
    write (*, "(a1, 1a163)") " ", repeat("-", 164)

contains

    real pure elemental function termino(n, x)
        real, intent(in):: x
        integer, intent(in):: n
        
        termino = 1/(n**2 * x**2)
    end function termino

end program serie

