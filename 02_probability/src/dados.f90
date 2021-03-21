program dados
    use iso_fortran_env
    use mod_dados
    implicit none

    integer, parameter:: max_i = 1000
    integer:: s, r(6)
    integer:: d(6)  ! Resultados de los seis dados
    integer:: b     ! Número de resultados buscados

    integer:: i, j, dado, e

    ! SETUP ---------------------
    e = 0   ! éxitos

    ! ALGORITMO ----------------
    iteracion: do i = 1, max_i
        r = 0
        do j=1,4
            d(j) = rnd(1,6)
            r(d(j)) = 1
        end do
        s = s+sum(r)

    end do iteracion

    ! RESULTADOS ------------------
    print *, "Suma", real(s)/max_i
end program dados
