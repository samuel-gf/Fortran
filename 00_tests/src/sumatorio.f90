program sumatorio
    use ISO_FORTRAN_ENV
    implicit none

    integer(int64):: suma
    integer:: i

    do i = 1, 45000
        suma = suma + 9999 + 2*i
    end do
    print *, "Suma ", suma
end program
