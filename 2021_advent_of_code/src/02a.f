program Advent_of_code_2021_02a
use iso_fortran_env
use mod_utils 

implicit none
integer, parameter:: fd = 1             ! File descriptor
character(len=10):: line                ! One line of input data
character(len=255):: ios_msg            ! File error message
integer:: ios                           ! I/O Status
integer:: answer                        ! Number I am looking for
integer:: i, j

type::t_mov                             ! One line, one movement
    character::dir                      ! direction
    integer::val                        ! value
end type
type(t_mov)::mov
integer::pos(2)                         ! Position (x,y) at the end

! ------------------------------------------
! Init vars
! ------------------------------------------
answer = 0


! ------------------------------------------
! Open file
! ------------------------------------------
open(unit=fd, file="dat/02_input.txt", action="read", iostat=ios, iomsg=ios_msg, status="old")
if (ios .ne. 0) then
    write (*,*) ios_msg
    stop 1
end if


! ------------------------------------------
! Read the file
! ------------------------------------------
i = 1                                   ! number of line
read(fd,"(a)",iostat=ios) line
do while(ios .eq. 0)
    do j=1,len(line)                    ! character in line
        if (line(j:j) .eq. " ") then
            mov% dir = line(1:1)
            mov% val = str_to_num(line(j+1:len(line)))

            if (mov% dir .eq. "u")    pos(2) = pos(2) - mov% val
            if (mov% dir .eq. "d")    pos(2) = pos(2) + mov% val
            if (mov% dir .eq. "f")    pos(1) = pos(1) + mov% val
            exit
        end if
    end do
    read(fd,"(a)",iostat=ios) line
    i = i + 1
end do
close(fd)




! ------------------------------------------
! Answer
! ------------------------------------------
answer = abs(pos(1)*pos(2))
write (*,*) "(", pos(1), ",", pos(2), ") = ", answer


end program Advent_of_code_2021_02a
