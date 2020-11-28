module m_derivada

contains
    pure function f(x) result(y)
        real, intent(in):: x
        real:: y
        y = (x**2+3)/(x+1)
    end function f

    pure function f_prima(x) result(y_prima)
        real, intent(in):: x
        real:: y_prima
        !y_prima = (x**2+2*x-3)/(x+1)**2
        y_prima = (x**2+2*x-3)/((x+1)**2)
    end function

end module m_derivada

program derivada
    use m_derivada
    implicit none

    integer:: i
    integer, parameter:: a = 20    ! Rango a estudiar |a|
    real:: x, y

    print *, "-------------------------------"
    print "(a7, a10, a10)", "x", "f(x)", "f'(x)"
    print *, "-------------------------------"
    do i = -a, a, 1
        x = real(i)*0.1
        print "(f7.1, f10.1, f10.3)", x, f(x), f_prima(x)
        !call sleep(1)
    end do
    print *, "-------------------------------"


end program derivada
