program Advent_of_code_2021_01a
use iso_fortran_env
use mod_utils 

implicit none
integer, parameter:: fd = 1             ! File descriptor
character(len=10):: line                ! One line of input data
character(len=255):: ios_msg            ! File error message
integer:: ios                           ! I/O Status
integer, allocatable:: data(:)          ! Structure where load data from input
integer:: n                             ! Number I am looking for
integer:: n_lines                       ! Number of lines in input file
integer:: i

! Init vars
i = 1
n = 0


! Open file
open(unit=fd, file="dat/01_input.txt", action="read", iostat=ios, iomsg=ios_msg, status="old")
if (ios .ne. 0) then
    write (*,*) ios_msg
    stop 1
end if


! Count number of lines
n_lines = lines_in_file(fd)
rewind(fd)
allocate(data(n_lines))


! Read the file
read(fd,"(a)",iostat=ios) line
do while(ios .eq. 0)
    !write(*,*) line, str_to_num(line)
    read(fd,"(a)",iostat=ios) line
    data(i) = str_to_num(line)
    i = i + 1
end do
close(fd)



! Main loop
do i = 2, size(data)
    if (data(i-1) .le. data(i))     n = n + 1
end do

write (*,"(i5, a)") n, " registers are greater"

end program Advent_of_code_2021_01a
