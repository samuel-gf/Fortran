program Advent_of_code_2021_03b
use iso_fortran_env
use mod_utils 

implicit none
integer, parameter:: fd = 1             ! File descriptor
character(len=12):: line                ! One line of input data
character(len=255):: ios_msg            ! File error message
integer:: ios                           ! I/O Status
integer::n_lines
integer:: i, j, k
integer:: n_valid
logical:: finish    = .false.
integer:: oxygen = 0, co2 = 0



logical, allocatable :: valid(:)              ! Is valid this row
integer, allocatable, dimension(:,:) :: a     ! Data
integer :: counter(12)                        ! Sum of column





! ------------------------------------------
! Open file
! ------------------------------------------
open(unit=fd, file="dat/03_input.txt", action="read", iostat=ios, iomsg=ios_msg, status="old")
if (ios .ne. 0) then
    write (*,*) ios_msg
    stop 1
end if


! ------------------------------------------
! Count number of lines
! ------------------------------------------
n_lines = lines_in_file(fd)
rewind(fd)

! ------------------------------------------
! Init vars
! ------------------------------------------
allocate(a(n_lines,12))
allocate(valid(n_lines))
counter = 0
valid = .true.


! ------------------------------------------
! Read the file
! ------------------------------------------
read(fd,"(a)",iostat=ios) line
i = 1                                           ! n line
do while(ios .eq. 0)                            ! Read a line
    
    do j=1,len(line)                            ! Character
        a(i, j) = ichar(line(j:j)) - ichar("0")
        if (a(i, j) .eq. 1) then
            counter(j) = counter(j) + 1
        else
            counter(j) = counter(j) - 1
        end if
    end do
    !write (*, "(i4, 12i3)") i, a(i,:)
    !if (i .ge. 100) stop 2

    read(fd,"(a)",iostat=ios) line
    i = i + 1                                   ! n line
end do
close(fd)

counter = counter / abs(counter)
write (*, "(a,12i3)") "Counter", counter
stop 2
!do i=1,1000
!    do j=1,12
!        write (*,"(12i1)",advance="no") a(i,j)
!    end do
!    write (*,*) ""
!end do


! ------------------------------------------
! Oxygen Loop
! ------------------------------------------
oxygen_loop: do 

    do j=1,12       ! nº characters
        n_valid = 0
        do i=1, n_lines

            if (valid(i) .and. &        ! Is valid
                ((counter(j) .ge. 0 .and. a(i,j) .eq. 1) .or.  &
                (counter(j) .lt. 0 .and. a(i,j) .eq. 0))) then

                    n_valid = n_valid + 1
            else
                valid(i) = .false.
            end if

        end do

        ! Exit condition
        print *, "Son válidos ", n_valid
        if (n_valid .eq. 1) exit oxygen_loop
    end do
end do oxygen_loop

! Compute level of oxygen
do i=1,n_lines
    if (valid(i) .eqv. .true.) then
        do j = 1, size(a(i,:))  ! To decimal
            oxygen = oxygen + a(i,j)*2**(12-j)
        end do
        
        write (*, "(a,12i1,i6)") "Oxygen ", a(i,:), oxygen
    end if
end do


! ------------------------------------------
! CO2 Loop
! ------------------------------------------
valid = .true.
co2_loop: do 

    ! Check to mark as not valid
    do j=1,12       ! nº characters
        n_valid = 0
        do i=1, n_lines

            if (valid(i) .and. &        ! Is valid
                ((counter(j) .ge. 0 .and. a(i,j) .eq. 0) .or.  &    ! Menos ceros
                (counter(j) .lt. 0 .and. a(i,j) .eq. 1))) then

                    n_valid = n_valid + 1
            else
                valid(i) = .false.
            end if

        end do

        ! Exit condition
        print *, "Son válidos ", n_valid
        if (n_valid .eq. 1) exit co2_loop
    end do
end do co2_loop

! Compute level of CO2
do i=1,n_lines
    if (valid(i) .eqv. .true.) then
        do j = 1, size(a(i,:))  ! To decimal
            co2 = co2 + a(i,j)*2**(12-j)
        end do
        
        write (*, "(a,12i1,i6)") "CO2 ", a(i,:), co2
    end if
end do
! ------------------------------------------
! Answer
! ------------------------------------------
print *, "ANSWER ", oxygen * co2

!LOW : 2223081
!HIGH: 3878091
end program Advent_of_code_2021_03b
