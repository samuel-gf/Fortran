program sumatorio
    use ISO_FORTRAN_ENV
    integer(int64):: i, total=0
    integer, parameter:: MAXIMO=100000

    do i = 1, MAXIMO
        total = total + i
    end do
    print *, "Suma ", total
end program
