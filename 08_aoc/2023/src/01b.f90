program aoc_01b
    use mod_utils
    implicit none

    integer:: f, ios, i
    character:: c, calibration(2)
    integer:: total

    character(len=10), allocatable:: a, b
    character(len=5), dimension(10):: num = ["zero", "one","two", "three", "four", "five", "six", "seven", "eight", "nine"]
    character(len=5):: str

    total = 0

    calibration = "__"
    open(newunit=f, file="in/01.txt", iostat=ios, access="sequential")
    read(f, "(a)", iostat=ios, advance="no") c
    do
        select case(ios)
            case (-2)   ! End of line
                total = total + ichar(calibration(1))*10-480
                total = total + ichar(calibration(2))-48
                calibration = "__"
            case (-1)   ! End of file
                print *, "TOTAL", total
                exit
            case (0)    ! Regular character
                call regular_character(c, calibration)
        end select
        read(f, "(a)", iostat=ios, advance="no") c
    end do
    close(f)


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
