program serie
    use iso_fortran_env
    implicit none

    integer, parameter:: N_s = 4                           ! Número de series (columnas)
    integer, parameter:: N_iteraciones = 100               ! Número de iteraciones (máximo valor de n)
    integer :: n                                           ! Índice de términos: 1, 2, 3, 4, ... 
    integer :: i                                           ! Índice de series (su valor máximo es N_s)
    real :: a_n(N_s), S(N_s)                               ! Array con cada uno de los términos y cada una de las sumas
    real :: x(N_s) = [0.0, 0.5, 1.0, 2.0]                  ! Valor de x para cada serie


    ! Cabecera
    write (*, "(a1, 1a164)") " ", repeat("-", 164)
    write (*, "(a5)", advance="no") "n"
    do i = 1, N_s                                          ! Muestra en la cabecera ' a_n (x=0.5)    Suma (x=0.5) '
        write (*, "(2(a15, f4.2, a1))", advance="no") "a_n (x=", x(i), ")", "Suma (x=", x(i), ")"
    end do
    write (*, *)
    write (*, "(a1, 1a164)") " ", repeat("-", 164)

    ! Bucle principal
    do n = 1, N_iteraciones
        write (*, "(i5)", advance="no") n
        do i = 1, 4
            a_n(i) = termino(n, x(i))
            S(i) = S(i) + a_n(i)
            write (*, "(2f20.8)", advance="no") a_n(i), S(i)
        end do
        write (*, *)
    end do

    ! Cierre
    write (*, "(a1, 1a164)") " ", repeat("-", 164)



contains

    ! Calcula un término de la serie
    real pure elemental function termino(n, x)
        real, intent(in):: x
        integer, intent(in):: n
        
        termino = 1/(n**2 * x**2)
    end function termino

end program serie

