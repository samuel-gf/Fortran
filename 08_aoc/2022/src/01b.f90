program aoc_02a
    use mod_utils
    implicit none

    integer:: f, i_linea, ios   ! f: file, n: number, i: index, ios: file status
    character(len=1):: s(3)

    i_linea = 0
    open(newunit=f, file="../in/02.txt", iostat=ios)
    do
        i_linea = i_linea + 1
        read(f, "(3a)", iostat=ios) s(1), s(3), s(2)
        if (ios .ne. 0) exit
        write (*,*) s(1), s(2), s(3)
        exit
    end do
    close(f)

end program aoc_02a
