module mod_global
end module mod_global
program dados
    ! Se lanza un dado equilibrado (1d6) y luego tantas monedas equilibradas como el valor
    ! obtenido en el dado. Sea X el número obtenido en el dado y N el número de caras
    use iso_fortran_env
    use mod_dados
    use mod_global
    implicit none

    integer, parameter:: max_i = 10

    integer:: i, j          ! bucles
    integer:: x             ! nº obtenido en el dado
    integer:: n             ! nº de caras
    integer:: e(4)          ! éxitos
    integer:: d(6), c(2)    ! Suma de valores del dado y de caras obtenidas
    integer:: intentos(4)   ! contador de intentos que cúmplen la precondición
    real:: esp_x, esp_n     ! esperanza de nº obtenido en dado y de número de caras
    real:: cov              ! covarianza


    ! SETUP ---------------------
    e = 0
    intentos = 0
    d = 0
    c = 0
    esp_x = 0
    esp_n = 0
    cov = 0



    ! ALGORITMO ----------------
    main_loop: do i = 1, max_i
        !write (*, "(i4,a2)", advance="no")   i,": "
        x = rnd(1,6)        ! Resultado del dado
        d(x) = d(x) + 1     ! Suma total de los valores del dado
        !write (*, "(a, i2, a)", advance="no") "dado ", x, "     "
        n = 0               ! Caras
        lanza_monedas: do j=1,x
            if (rnd(1,2) == 1)  then
                c(1) = c(1) + 1
                n = n + 1
                !write (*, "(a2)", advance="no") "1"
            else
                !write (*, "(a2)", advance="no") "0"
                c(2) = c(2) + 1
            end if
        end do lanza_monedas
        print *, d, "  caras", c
        !e(3) = e(3) + n      ! Número de caras obtenidas en total del experimento


        ! COMPROBAR ÉXITOS ------------------------------
        if (n==3) then       ! Obtener 3 caras
            e(1) = e(1) + 1
            intentos(2) = intentos(2) + 1
            if (x==5)    then
                e(2) = e(2) + 1
                !write (*, "(a,i4)", advance="no") " ÉXITO ", e
            end if
        end if

        !write (*,*) ""
    end do main_loop



    ! RESULTADOS ------------------
    esp_n = real(sum(c)) / i     ! esperanza de caras
    esp_x = real(sum(d)) / i     ! esperanza de valores del dado
    ! TODO calcular la Covarianza
    cov = cov / i
    write (*, "(a12, f10.4)") "Resultado_1", real(e(1))/i
    write (*, "(a12, f10.4)") "Resultado_2", real(e(2))/intentos(2)
    write (*, "(a12, f10.4)") "Resultado_3", esp_n
    write (*, "(a12, 2f10.4)") "Resultado_4", cov, -(esp_n*esp_x)

end program dados
