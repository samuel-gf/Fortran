program array_to_integer
    implicit none

    integer, allocatable:: a(:)
    integer:: a_size, answer, i, pos

    ! Setup
    a = [2, 5, 6]
    a_size = size(a)
    answer = 0

    ! Main loop
    do i = 1, a_size
        pos = a_size - i
        answer = answer + a(i) * 10**pos
    end do

    ! Show answer
    print *, "answer ", answer

end program array_to_integer
