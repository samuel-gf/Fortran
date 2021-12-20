module mod_utils
implicit none

contains

integer function str_to_num(str) result(total)
    ! From character(len=*) to integer
    implicit none
    character(len=*), intent(in):: str
    integer:: n                         ! Figure
    integer:: i                         ! Index
    integer:: weight                    ! 1, 10, 100, 1000...

    total = 0
    weight = 1

    do i=len(str),1,-1
        n = ichar(str(i:i))-48
        if (n .ge. 0 .and. n .le. 9) then
            if (n .ne. 0) total = total + n * weight
            weight = weight * 10
        end if
    end do
end function



integer function lines_in_file(fd) result(n)
    ! Get number of lines in an open file
    implicit none
    integer, intent(in):: fd
    integer:: ios
    character(len=80):: line          ! One line of input data

    n = 0
    
    read(fd,"(a)",iostat=ios) line
    do while(ios .eq. 0)
        n = n + 1
        read(fd,"(a)",iostat=ios) line
    end do
end function
end module mod_utils
