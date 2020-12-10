program fixed

    print *, bin(2)

contains

    function bin(x) result(str)
        integer, intent(in) :: x
        character(len=:), allocatable :: str

        integer :: n, i

        n = max(1,bit_size(x)-leadz(x))     ! Número de bits en blanco a la izquierda
        allocate(character(len=n) :: str)   ! Un carácter por cada bit

        ! Caso especial --------------------------------
        if (x == 0) then
            str(1:1) = '0'
            return
        end if

        ! Caso general ---------------------------------
        str = repeat('0',n)
        do concurrent (i = 0:n-1, btest(x,i))
            str(n-i:n-i) = '1'
        end do
    end function

end program fixed
