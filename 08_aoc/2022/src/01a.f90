program aoc_01a
    use mod_utils
    implicit none

    integer:: f, n, i, ios      ! f: file, n: number, i: index, ios: file status
    integer:: suma, suma_max
    character(len=80)::s        ! s: string, line

    suma = 0
    suma_max = 0
    i = 0
    open(newunit=f, file="../in/01a.txt", iostat=ios)
    do
        i = i + 1
        read(f, "(i)", iostat=ios) n 
        if (ios .ne. 0) exit
        if (n .ne. 0) then
            suma = suma + n
        else
            if (suma .gt. suma_max) then
                suma_max = suma
                suma = 0
            end if
            suma = 0
        end if
        !if (i .eq. 15) exit
    end do
    close(f)
    write (*,*) "Suma máxima ", suma_max

end program aoc_01a
