program hipoteca
    implicit none
    integer:: year
    real:: pagar        ! Cantidad total a pagar cada mes
    real:: capital      ! Capital pendiente de amortizar
    real:: c_interes    ! Parte de la cuota que corresponde a interéses
    real:: c_amortiz    ! Parte de la cuota que corresponde a amortización
    real:: t_interes    ! Total de interés pagado
    real:: e_amortiz    ! Amortizado extra al año
    integer, parameter:: total_year = 28                            ! Total años
    real, parameter:: interes_fijo = 0.0105                         ! Interés fijo

    capital = 410000*1.06-111000                                    ! Capital inicial
    t_interes = 0


    write (*, "(A5, 2A15, A16, 2A15)") "AÑO", "PENDIENTE", "PAGAR/MES", "C.INTERÉS", "C.AMORTIZADO", "E.AMORTIZADO"
    do year = 0, total_year
        pagar = calcula_cuota_mes(capital, total_year-year, interes_fijo)   ! Dinero pagado al banco cada mes
        c_interes = capital * interes_fijo                          ! Cuota (parte) correspondiente al interés
        t_interes = t_interes + c_interes                           ! Total de interés
        c_amortiz = pagar*12 - c_interes                            ! Cuota (Parte) de capital amortizado

        ! e_amortiz: Extra amortizado cada mes (amortización parcial)
        ! Pagar la hipoteca y apartar 1200€/mes
        ! Invertir 250 del estudiante en hipoteca al mes
        !e_amortiz = 28000 + (10*250) - 12*(pagar/2+1200)
        e_amortiz = 12*300

        write (*, "(i4, 5f15.2)") year, capital, pagar, c_interes/12, c_amortiz/12, e_amortiz/12
        capital = capital - c_amortiz - e_amortiz
        if (capital < 0) exit
    end do

    print *, "-------------------------------------------"
    print *, "Total de interés pagado: ", t_interes

contains
    real pure function calcula_cuota_mes(c, y, i) result(r)
        integer, intent(in):: y ! year
        real, intent(in):: c, i ! capital, interés
        r = ((c*i)/12)/(1-(1+i/12)**(-12.0*y))
    end function calcula_cuota_mes


end program hipoteca
