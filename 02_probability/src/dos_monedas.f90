program dos_monedas
    ! Simula el lanzamiento de dos monedas con probabilidad de cara p1 y p2 respectivamente
    use iso_fortran_env
    use mod_dados
    implicit none

    integer, parameter:: max_i = 1000
    real, parameter:: p1=0.1, p2=0.5
    integer:: pint1, pint2, ptotal  ! Probabilidades en enteros
    integer:: m(2)      ! resultado al lanzar la Moneda: 1Cara 2Cruz
    integer:: ra(4)     ! Resultados Acumulados     1:CC, 2:CX, 3:XC, 4:XX
    real:: med_ra(4)    ! Media de Resultados Acumulados
    integer:: l         ! Lanzamientos realizados

    integer:: i, j, k

    ! SETUP ---------------------
    ra = 0
    pint1 = p1*1000
    pint2 = p2*1000
    ptotal = pint1 + pint2
    med_ra = 0



    ! ALGORITMO ----------------
    iteracion: do i = 1, max_i
        l = 0
        ra = 0
        juego: do
            l = l + 1
            m(1) = rnd(1,ptotal)
            m(2) = rnd(1,ptotal)

            ! CC
            if (m(1)<=pint1 .and. m(2)<=pint1) then
                ra(1) = ra(1) + 1
                med_ra = med_ra + (ra / real(l))        ! acumula la media de resultados acumulados
                exit
            end if

            ! CX
            if (m(1)<=pint1 .and. m(2)>pint1) then
                ra(2) = ra(2) + 1
            end if

            ! XC    Debo contar estos
            if (m(1)>pint1 .and. m(2)<=pint1) then
                ra(3) = ra(3) + 1
            end if

            ! XX
            if (m(1)>pint1 .and. m(2)>pint1) then
                ra(4) = ra(4) + 1
            end if
        end do juego
    end do iteracion

    ! RESULTADOS ------------------
    med_ra = med_ra / real(max_i)                       ! calcula la media de medias
    print *, "Media acumulada", med_ra
    print *, "Total juegos ", max_i
end program dos_monedas
