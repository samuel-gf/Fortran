module mod_utils
implicit none


contains

! From character(len=*) to integer
pure integer function str2num(str) result(total)
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

function num2str(n) result(str)
    implicit none
    integer, intent(in):: n
    character(len=80):: str
    
    write(str,"(i0)") n
    str = trim(str)

end function


! Get number of lines in an open file
integer function lines_in_file(fd) result(n)
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

! Test if a character c, is a digit [0-9]
logical function is_digit(c) result(r)
    implicit none
    character, intent(in):: c
    r = .false.
    if ((ichar(c) .ge. 48) .and. (ichar(c) .le. 57)) then
        r = .true.
    end if
end function


! Returns the position of string a in b
! a: Needle; b: Stack
integer pure function str_find(a, b) result(pos)
    implicit none
    character(len=*), intent(in):: a, b
    integer:: i, j

    pos = -1
    str_b: do i=1, len(b)       ! Stack loop
        str_a: do j=1, len(a)   ! Needle loop
            if (a(j:j) .ne. b(i+j-1:i+j-1)) cycle str_b
        end do str_a
        pos = i
        exit str_b
    end do str_b
end function

! Replace a with b in c
pure function str_replace(a, b, c) result(str)
    implicit none
    character(len=*), intent(in):: a, b, c
    character(len=:), allocatable:: str
    integer:: str_begin, str_end

    str = trim(c)
    str_begin = str_find(a, c)
    replace: do
        if (str_begin .eq. -1) exit replace

        str_end = str_begin + len(a)
        str = str(1:str_begin-1) // trim(b) // str(str_end:)
        str_begin = str_find(a, str)
    end do replace
end function

! Get position of first digit in string
pure function str_pos_first_digit(str) result(n)
    implicit none
    character(len=*):: str
    character:: c

    do i=1, len(s)
        c = str(i:i)
        if ((ichar(c) .ge. 48) .and. (ichar(c). .le. 57)) then
            n = i
            exit
        end
    end do
end function

end module mod_utils
