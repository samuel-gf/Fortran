program aoc_01b
    use mod_utils
    implicit none

    integer:: f, ios, i, j, k
    character:: c, calibration(2)
    integer:: total
    logical:: b_exit

    integer:: pos(10)   ! Posición de cada palabra letra en la línea de entrada
    character(len=5), dimension(9):: num = ["one","two", "three", "four", &
                                             "five", "six", "seven", "eight", "nine"]
    character(len=80):: line, line_original

    total = 0

    calibration = "__"
    open(newunit=f, file="in/01.txt", iostat=ios, access="sequential")
    read(f, "(a)", iostat=ios) line_original
    line = trim(line_original)

    linea: do
        replace: do
            b_exit = .true.
            ! Find the first position of each number in the input line
            busca: do i=1, size(num) 
                pos(i) = str_find(trim(num(i)), line)
                if (pos(i) .ne. -1) b_exit = .false.
            end do busca

            if (b_exit) exit replace

            ! Discover what number is in the first position.
            ! j: the first position
            ! k: the entry in the array num(k)
            ! Example: The first position corresponds to num(k) that is in position j."
            j = len(line)
            first_pos: do i=1, size(num)
                if (pos(i) .le. 0) cycle
                if (pos(i) .lt. j) then
                    j = pos(i)
                    k = i
                end if
            end do first_pos
            line = str_replace(trim(num(k)), num2str(k), line)
        end do replace

        ! Process each line character by character.
        caracter: do i=1, len(trim(line))
            call regular_character(line(i:i), calibration)
        end do caracter

        ! Sum total
        total = total + ichar(calibration(1))*10-480
        total = total + ichar(calibration(2))-48
        write (*,"(a50, 2a, i6)") line_original, calibration, total
        calibration = "__"

        ! Read other line or exit
        read(f, "(a)", iostat=ios) line_original
        line = trim(line_original)
        if (ios .lt. 0) exit linea
    end do linea
    close(f)
    print *, "TOTAL", total
    ! No es 57340


contains

    subroutine regular_character(c, calibration)
        implicit none
        character, intent(in) :: c
        character, intent(out):: calibration(2)
        select case(ichar(c))
            case (48:57)    ! Is a digit
                if (calibration(1) .eq. "_") then
                    calibration(1) = c
                    calibration(2) = c
                else
                    calibration(2) = c
                end if
        end select
    end subroutine





end program aoc_01b
