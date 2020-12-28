program cartas
    use iso_fortran_env
    use mod_dados
    implicit none
    integer,parameter:: max_i = 1000000
    logical:: r(40)
    integer:: c(6)
    integer:: v(10) ! Valores obtenidos tras la extracción
    integer:: b     ! Número de resultados buscados
    integer:: e(2)  ! Éxito porque tiene las tres parejas
    integer:: t, p  ! Trio y pareja

    integer:: i, j, k, dado

    ! SETUP ---------------------
    r = .false.
    e = 0       ! Éxitos del primer apartado y del segundo

    ! ALGORITMO ----------------
    iteracion: do i = 1, max_i
        r = .false.
        v = 0
        b = 0
        elige_carta: do j=1,6
            dado = rnd(1,40)
            do while (r(dado) .eqv. .true.)
                dado = rnd(1,40)
            end do
            r(dado) = .true.
            c(j) = dado
        end do elige_carta


        ! c número de la carta independientemente del palo
        simplifica: do j=1,6
            c(j) = c(j)-(int(c(j)/10.0)*10)
        end do simplifica


        ! Comprueba cuantos resultados de cada número
        suma_resultados: do j=1,6
            v(c(j)) = v(c(j)) + 1
        end do suma_resultados


        b = 0   ! buscados
        p = 0   ! parejas
        t = 0   ! tríos
        cuenta_grupos: do j=1,10
            if (v(j)==2) then
                p = p + 1
            end if
            if (v(j)==3) then
                t = t + 1
            end if
        end do cuenta_grupos

        ! Analiza los resultados y cuenta los éxitos

        ! Si hay tres parejas
        if (p==3)   e(1) = e(1) + 1

        ! Si hay un trío y una pareja
        if (t==1 .and. p==1)    e(2) = e(2) + 1

    end do iteracion

    ! RESULTADOS ------------------
    print *, "Caso 1: ", real(e(1))/max_i
    print *, "Caso 2: ", real(e(2))/max_i

end program cartas
