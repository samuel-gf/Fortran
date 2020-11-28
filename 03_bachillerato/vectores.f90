program vectores
    real:: a(4), b(4)
    real:: c(3,3)
    integer, parameter:: k = 7

    a = [1, 2, 3, 4]
    c = reshape((/1, 1, 1, 2, 2, 2, 3, 3, 3/), (/3, 3/))

    call f(a, b, k)

    !print "(4f6.0)", b
    print *, shape(c)

contains

    subroutine f(a, b, k)
        real, intent(in):: a(:)
        real, intent(out):: b(:)
        integer, intent(in):: k
        b = k*a
    end subroutine

end program vectores
