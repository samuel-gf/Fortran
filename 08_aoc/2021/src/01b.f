program Advent_of_code_2021_01b
use iso_fortran_env
use mod_utils 

implicit none
integer, parameter:: fd = 1             ! File descriptor
character(len=10):: line                ! One line of input data
character(len=255):: ios_msg            ! File error message
integer:: ios                           ! I/O Status
integer, allocatable:: data(:)          ! Structure where load data from input
integer:: answer                        ! Number I am looking for
integer:: n_lines                       ! Number of lines in input file
integer:: i

integer:: suma(2)                       ! sum of a window

! ------------------------------------------
! Init vars
! ------------------------------------------
answer = 0


! ------------------------------------------
! Open file
! ------------------------------------------
open(unit=fd, file="dat/01_input.txt", action="read", iostat=ios, iomsg=ios_msg, status="old")
if (ios .ne. 0) then
    write (*,*) ios_msg
    stop 1
end if


! ------------------------------------------
! Count number of lines and allocate space in data array
! ------------------------------------------
n_lines = lines_in_file(fd)
rewind(fd)
allocate(data(n_lines))


! ------------------------------------------
! Read the file
! ------------------------------------------
i = 1
read(fd,"(a)",iostat=ios) line
do while(ios .eq. 0)
    !write(*,*) line, str_to_num(line)
    data(i) = str_to_num(line)
    read(fd,"(a)",iostat=ios) line
    i = i + 1
end do
close(fd)


! ------------------------------------------
! Main loop
! ------------------------------------------
do i = 1, size(data)-3
    suma(1) = data(i)+data(i+1)+data(i+2)
    suma(2) = data(i+1)+data(i+2)+data(i+3)
    if (suma(1) .lt. suma(2)) answer = answer + 1
    !if (i .eq. 4) exit
end do


! ------------------------------------------
! Answer
! ------------------------------------------
write (*,"(i5, a)") answer, " registers are greater"


end program Advent_of_code_2021_01b
