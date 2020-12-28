module mod_dados
    use iso_fortran_env
    implicit none

contains

    integer function rnd(desde, hasta) result(ans)
        integer, intent(in):: desde, hasta
        real:: r

        call random_number(r)
        ans = int(r*(hasta-desde+1))+desde
    end function rnd

end module mod_dados

