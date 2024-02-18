program inversiones
    use iso_fortran_env
    implicit none

    character(len=3), dimension(12):: s_mes = ["Ene", "Feb", "Mar", "Abr", &
                                               "May", "Jun", "Jul", "Ago", &
                                               "Sep", "Oct", "Nov", "Dic"]
    real, parameter:: mensualidad = 250, extra = 2000, inicial = 8750, interes = (0.035/12)
    integer, parameter:: N = 2*12                           ! Número de meses para el bucle
    
    integer:: i_mes, i_year, invertido
    real:: acumulado
    real:: beneficio(N)
    

    acumulado = inicial
    invertido = inicial
    i_year = 2024
    beneficio = 0

    write (*,"(a4, a5, a6, 4a10)") "I", "MES", "AÑO", "ACUMULADO", "INVERTIDO", "BENEFICIO", "B/MES"
    write (*, "(i4, a5, i5, f10.2, i10, f10.2, a10)") 0, "Dic", 2023, 9000.0, 9000, acumulado-invertido, "-"
    do i_mes=1, N
        acumulado = acumulado + mensualidad                 ! Añado mensualidad
        beneficio(i_mes) = acumulado*interes                ! Calculo el beneficio
        !acumulado = acumulado + beneficio(i_mes)           ! Reinverto beneficio
        invertido = invertido + mensualidad                 ! Llevo la cuenta de lo invertido

        write (*, "(i4, a5, i5, f10.2, i10, 2f10.2)", advance="no") i_mes, s_mes(mod(i_mes-1,12)+1), &
                                                       i_year, acumulado, invertido, sum(beneficio),  &
                                                       beneficio(i_mes)
        if (mod(i_mes,6) .eq. 0) then
            acumulado = acumulado + extra
            invertido = invertido + extra
            write (*,"(a6)", advance="no") "+2000"
        end if
        if (mod(i_mes, 12) .eq. 0) i_year = i_year + 1

        write (*,*)
    end do


end program inversiones
