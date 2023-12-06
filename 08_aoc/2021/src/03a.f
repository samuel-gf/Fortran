program Advent_of_code_2021_03a
use iso_fortran_env
use mod_utils 

implicit none
integer, parameter:: fd = 1             ! File descriptor
character(len=12):: line                ! One line of input data
character(len=255):: ios_msg            ! File error message
integer:: ios                           ! I/O Status
integer:: i, j

integer::gam
integer::eps
integer::counter(12)


! ------------------------------------------
! Init vars
! ------------------------------------------
counter = 0
gam = 0
eps = 0
line = ""

! ------------------------------------------
! Open file
! ------------------------------------------
open(unit=fd, file="dat/03_input.txt", action="read", iostat=ios, iomsg=ios_msg, status="old")
if (ios .ne. 0) then
    write (*,*) ios_msg
    stop 1
end if


! ------------------------------------------
! Read the file
! ------------------------------------------
read(fd,"(a)",iostat=ios) line
j = 1
do while(ios .eq. 0)
    ! Read line
    do i=1,len(line)
        if (line(i:i) .eq. "1") then
            counter(i) = counter(i) + 1
        else
            counter(i) = counter(i) - 1
        end if
    end do

    read(fd,"(a)",iostat=ios) line
end do
close(fd)

! ------------------------------------------
! Main loop
! ------------------------------------------
do i=1,12
    if (counter(i) .ge. 1) then
        gam = gam + 2**(12-i)
    else
        eps = eps + 2**(12-i)
    end if
end do


! ------------------------------------------
! Answer
! ------------------------------------------
write (*,*) gam*eps

end program Advent_of_code_2021_03a
