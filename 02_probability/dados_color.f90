program dados_color
    ! TODO sin terminar. No funciona
    ! Se lanza un dado equilibrado (1d6) y luego tantas monedas equilibradas como el valor
    ! obtenido en el dado. Sea X el número obtenido en el dado y N el número de caras
    use iso_fortran_env
    use mod_dados
    implicit none

    ! PARAMETROS
    integer, parameter:: max_i = 10000
    real(real64), parameter:: max_i_inv = 1.0d0/max_i
    integer, parameter:: blanco = 1, rojo = 2

    ! VARIABLES
    integer:: i, j                      ! bucles
    integer:: d                         ! resultado del dado
    real:: esp(2) = 0                   ! esperanza de blanco y de rojo
    real:: s(2) = 0                     ! suma de resultados
    integer:: res(2) = 0                ! resultados de blanco y de rojo
    character(len=*), parameter:: fmt_result_i = "(a16, 2i10)"
    character(len=*), parameter:: fmt_result_f = "(a16, 2f10.4)"



    ! BUCLE PRINCIPAL -----------------------------------------------------
    main_loop: do i = 1, max_i
        res = 0
        juego_loop: do j = 1, 1000
            d = rnd(1,3)                            ! Resultado del dado
            if (d .le. 2) then                      ! Anotar resultados
                res(blanco) = res(blanco) + 1
            else
                res(rojo) = res(rojo) + 1
            end if

            ! EL JUEGO TERMINA
            if (res(blanco) .ge. 1 .and. res(rojo) .ge. 1)  exit juego_loop
        end do juego_loop

        esperanza: do j = 1, 2
            esp(j) = real(res(j))/sum(res)
            s(j) = s(j) + esp(j)
        end do esperanza


    end do main_loop



    ! RESULTADOS --------------------------------------------------
    esp = s/i

    write (*, *) "RESULTADOS"                   ! Mostrar resultados

    write (*, fmt_result_f) "Esperanza", esp




end program dados_color
