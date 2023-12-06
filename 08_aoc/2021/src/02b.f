program Advent_of_code_2021_02b
use iso_fortran_env
use mod_utils 

implicit none
integer, parameter:: fd = 1             ! File descriptor
character(len=10):: line                ! One line of input data
character(len=255):: ios_msg            ! File error message
integer:: ios                           ! I/O Status
integer:: i, j

type::t_mov                             ! One line, one movement
    character::dir                      ! direction
    integer::val                        ! value
end type
type(t_mov)::mov
integer::pos(2)                         ! Position (x,y) at the end
integer::aim


! ------------------------------------------
! Init vars
! ------------------------------------------
pos = 0
aim = 0


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
read(fd,"(a)",iostat=ios) line
do while(ios .eq. 0)
    ! Read line
    do i=1,len(line)
        if (line(i:i) .eq. " ") then
            mov %dir = line(1:1)
            mov %val = str_to_num(line(i+1:len(line)))
            exit
        end if
    end do

    ! Compute new position
    if (mov% dir .eq. "d") then         ! Down
        aim = aim + mov %val
    end if
    if (mov% dir .eq. "u") then         ! Up
        aim = aim - mov %val
    end if
    if (mov% dir .eq. "f") then         ! Forward
        pos(1) = pos(1) + mov %val
        pos(2) = pos(2) - aim * mov %val
    end if
    read(fd,"(a)",iostat=ios) line
end do
close(fd)




! ------------------------------------------
! Answer
! ------------------------------------------
write (*,*) "(", pos(1), ",", pos(2), ") = ", abs(pos(1)*pos(2))

end program Advent_of_code_2021_02b
