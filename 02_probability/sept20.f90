program dados
    ! Se lanza un dado equilibrado (1d6) y luego tantas monedas equilibradas como el valor
    ! obtenido en el dado. Sea X el número obtenido en el dado y N el número de caras
    use iso_fortran_env
    use mod_dados
    implicit none

    ! PARAMETROS
    integer, parameter:: max_i = 1000000
    real(real64), parameter:: max_i_inv = 1.0d0/max_i

    ! VARIABLES
    integer:: i, j                      ! bucles
    integer:: x                         ! nº obtenido en el dado
    integer:: n                         ! nº de caras
    integer:: Ve(4)=0                   ! Vector éxitos
    integer:: Vd(6)=0, Vc(2)=0          ! Vector suma de valores del dado y de caras obtenidas
    integer:: vintentos(4)=0            ! contador de intentos que cúmplen la precondición
    real:: esp_x=0, esp_n=0             ! esperanza de nº obtenido en dado y de número de caras
    real:: cov=0                        ! covarianza
    character(len=*), parameter:: fmt_result = "(a16, f8.4)"



    ! BUCLE PRINCIPAL -----------------------------------------------------
    main_loop: do i = 1, max_i
        x = rnd(1,6)                            ! Resultado del dado
        Vd(x) = Vd(x) + 1                         ! Suma total de los valores del dado
        n = 0                                   ! Caras
        lanza_monedas: do j=1,x
            if (rnd(1,2) == 1)  then            ! Si obtiene cara
                Vc(1) = Vc(1) + 1
                n = n + 1
            else
                Vc(2) = Vc(2) + 1
            end if
        end do lanza_monedas
        cov = cov + (n*x)                       ! Suma de los resultados de covarianza


        ! COMPROBAR ÉXITOS -------------------------------------------
        if (n==3) then                          ! Obtener 3 caras
            Ve(1) = Ve(1) + 1                     ! Obtenido tres caras
            vintentos(2) = vintentos(2) + 1       ! Intentos válidos según la condición
            if (x==5)    then                   ! Si se obtiene un 5 en el dado
                Ve(2) = Ve(2) + 1                 ! Éxito apartado (2), tiene N=3 y X=5
            end if
        end if

    end do main_loop



    ! RESULTADOS --------------------------------------------------
    esp_n = real(Vc(1)) / max_i                 ! esperanza de caras
    suma_resultados_dado: do i = 1, 6           ! esperanza de dado
        esp_x = esp_x + Vd(i)*i
    end do suma_resultados_dado
    esp_x = real(esp_x) / max_i
    cov = (cov * max_i_inv) - (esp_n*esp_x)     ! Covarianza

    write (*, *) "RESULTADOS"                   ! Mostrar resultados
    write (*, *) ""

    write (*, fmt_result) "Resultado_1", real(Ve(1))/max_i
    write (*, fmt_result) "Resultado_2", real(Ve(2))/vintentos(2)
    write (*, fmt_result) "Resultado_3", esp_n
    write (*, fmt_result) "Resultado_4", cov

    write (*,*) " "
    write (*, fmt_result) "Esperanza caras", esp_n
    write (*, fmt_result) "Esperanza dado", esp_x



end program dados
