program cuotas
    ! Calcula la cuota mes a mes
    implicit none
    integer:: mes, year ! Índice del mes en el que estamos y año
    real:: pagar        ! Cantidad total a pagar cada mes
    real:: capital      ! Capital pendiente de amortizar
    real:: c_interes    ! Parte de la cuota que corresponde a interéses
    real:: c_amortiz    ! Parte de la cuota que corresponde a amortización
    real:: t_interes    ! Total de interés pagado
    real:: e_amortiz    ! Amortizado extra al año
    integer, parameter:: n_cuotas = 28*12
    real, parameter:: interes_fijo = 0.0105                         ! Interés fijo

    character(len=12)::s_meses(12)
    s_meses(1) = "Ene"
    s_meses(2) = "Feb"
    s_meses(3) = "Mar"
    s_meses(4) = "Abr"
    s_meses(5) = "May"
    s_meses(6) = "Jun"
    s_meses(7) = "Jul"
    s_meses(8) = "Ago"
    s_meses(9) = "Sep"
    s_meses(10)= "Oct"
    s_meses(11)= "Nov"
    s_meses(12)= "Dic"

    capital = 323600                                                ! Capital inicial
    t_interes = 0
    year = 0 


    write (*, "(A4, A4, 2A15, A16, 2A15)") "AÑO", "MES", "PENDIENTE", "PAGAR/MES", "C.INTERÉS", "C.AMORTIZADO", "E.AMORTIZADO"
    do mes = 1, n_cuotas
        pagar = calcula_cuota_mes(capital, n_cuotas-mes+1, interes_fijo)  ! Dinero pagado al banco cada mes
        c_interes = (capital * interes_fijo)/12                         ! Cuota (parte) correspondiente al interés
        c_amortiz = pagar - c_interes                                   ! Cuota (Parte) de capital amortizado
        t_interes = t_interes + c_interes                               ! Total de interés

        ! e_amortiz: Extra amortizado cada mes (amortización parcial)
        ! Pagar la hipoteca y apartar 1200€/mes
        ! Invertir 250 del estudiante en hipoteca al mes
        !e_amortiz = 28000 + (10*250) - 12*(pagar/2+1200)
        e_amortiz = 0

        !if (mes > 16) then
        !    e_amortiz = 250*2
        !end if

        write (*, "(i3, i4, 5f15.2)") year, mes, capital, pagar, c_interes, c_amortiz, e_amortiz
        !write (*, "(i3, i4, 5f15.2)") year, mes, " ", s_meses(mod(mes+3,12)+1), capital, pagar, c_interes, c_amortiz, e_amortiz

        capital = capital - c_amortiz - e_amortiz
        if (mod(mes, 12) .eq. 0)    year = year + 1
        if (capital < 0) exit
    end do

    print *, "-------------------------------------------"
    print *, "Total de interés pagado: ", t_interes

contains
    real pure function calcula_cuota_mes(c, n, i) result(r)
        integer, intent(in):: n ! Número de cuotas restantes
        real, intent(in):: c, i ! capital, interés
        r = ((c*i)/12)/(1-(1+i/12)**(-real(n)))
    end function calcula_cuota_mes


end program cuotas
