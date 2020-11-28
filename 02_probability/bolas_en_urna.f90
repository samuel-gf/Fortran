module mod_bolas_en_urna
    integer, parameter:: n_urnas=3, n_bolas=6, casos_posibles=3**n_bolas
    integer:: n_bolas_en_urna(n_urnas)
    integer:: casos_favorables
end module mod_bolas_en_urna

program bolas_en_urna
    use mod_bolas_en_urna
    implicit none
    integer:: v(n_bolas), i
    character(len=100):: fmt_vector

    ! Setup
    v = 1
    casos_favorables = 0
    write (fmt_vector, *) "(", n_bolas, "i3)"
    print *, "------------------------------------------------------------------"
    print *, "  BOLA EN LA URNA        Nº BOLAS CADA URNA     CASO FAVORABLE"
    print *, "------------------------------------------------------------------"


    !call mostrar_fila_info()
    do i = 2, casos_posibles
        call next_iteration(v, n_bolas)
    end do

    print *, "------------------------------------------------------------------"
    print *, "Casos favorables: ", casos_favorables
contains


    recursive subroutine next_iteration(v, p)
        integer, intent(inout):: v(n_bolas)
        integer:: p

        if (v(p) /= n_urnas) then
            v(p) = v(p) + 1
            call mostrar_fila_info()
            !print *, ""
            !call mostrar_urnas()
        else
            v(p) = 1
            call next_iteration(v, p-1)
        end if
    end subroutine next_iteration



    subroutine contar_bolas_en_urna()
        integer:: i

        n_bolas_en_urna = 0
        do i = 1, n_bolas
            n_bolas_en_urna(v(i)) = n_bolas_en_urna(v(i)) + 1
        end do
    end subroutine


    subroutine test_caso_buscado()
        if (n_bolas_en_urna(1) == 3 .or. n_bolas_en_urna(2) == 3 .or. n_bolas_en_urna(3) == 3) then
            casos_favorables = casos_favorables + 1
            write (*, "(a, i4)") "           Sí nº", casos_favorables
        else
            write (*, "(a12)", advance="no") ""
        end if
    end subroutine test_caso_buscado



    subroutine mostrar_urnas()
        ! Muestra gráficamente las urnas con asteríscos que representan las bolas
        integer:: i, j

        !write (*, "(a)") "--------------------------------"
        urna: do i = 1, n_urnas
            write (*,"(a1)",advance="no") "|"
            asterisco: do j = 1, n_bolas_en_urna(i)
                ! Un asterisco por cada bola en la urna
                write (*,"(a1)",advance="no") "*"
            end do asterisco
            blancos: do j = 1, n_bolas - n_bolas_en_urna(i)
                write (*,"(a1)",advance="no") " "
            end do blancos
        end do urna
        write (*,"(a1)",advance="yes") "|"
    end subroutine mostrar_urnas


    subroutine mostrar_fila_info()
        ! Testea el caso buscado y cuenta las bolas en cada urna
        call test_caso_buscado()
        call contar_bolas_en_urna()
        write (*, fmt_vector, advance="no") v
        write (*, "(a14, 3i3)", advance="no") "", n_bolas_en_urna
        call mostrar_urnas()
        call sleep(1)
    end subroutine mostrar_fila_info


end program
