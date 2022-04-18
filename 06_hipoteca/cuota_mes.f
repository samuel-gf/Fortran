program cuota
    implicit none
    real:: pagar                                ! Cantidad total a pagar cada mes
    real:: capital =323600                      ! Capital pendiente de amortizar
    real, parameter:: interes_fijo = 0.0105     ! Interés fijo
    integer:: n_cuotas = 28*12
    integer:: i


    do i = 0, n_cuotas
        write (*, "(i4, 5f15.2)") i, calcula_cuota_mes(capital, n_cuotas-i, interes_fijo)
        capital = capital - 100
    end do

contains
    real pure function calcula_cuota_mes(c, n, i) result(r)
        integer, intent(in):: n ! número de cuotas
        real, intent(in):: c, i ! capital, interés
        r = ((c*i)/12)/(1-(1+i/12)**(-real(n)))
    end function calcula_cuota_mes


end program cuota
