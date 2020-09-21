#define __ROWS 1000000000
#define __COLUMNS 100000
#define __COLUMN_STRING "100000"
#define __N_CASES 4
#define __FILE_UNIT 1


program loop_speed
implicit none
    real:: a(__COLUMNS, __ROWS)
    real:: time(__N_CASES+1)   ! There are 3 cases whose time must be meassured

    call cpu_time(time(1))
    call case1(a)        ! Case 1: Outer loop j, inner loop i
    call cpu_time(time(2))
    call case2(a)        ! Case 2: Outer loop i, inner loop j
    call cpu_time(time(3))
    call case3(a)        ! Case 3: Outer loop j, inner loop i, parallel do
    call cpu_time(time(4))
    call case4(a)        ! Case 4: Outer loop i, inner loop j, parallel do
    call cpu_time(time(5))

    call show_results(time)
    stop 0

contains

! Show time elapsed in each case
subroutine show_results(time)
    real, intent(in):: time(__N_CASES + 1)
    integer:: i

    ! print *, time
    do i = 1, __N_CASES
        write (*, "(A,I1,A,F4.1,A)") "Case ", i, ": ", (time(i+1)-time(i))*1e6," nano seconds"
    end do
end subroutine

! --------------------------------
subroutine write_to_file(a)
    real, intent(in):: a(__COLUMNS, __ROWS)
    integer:: i, j
    character(len=*), parameter:: fmt = "(" // __COLUMN_STRING // "F8.2)"


    write (*,"(A)", advance="no") "Write to file squares.dat ... "
    open(unit=__FILE_UNIT, file="squares.dat", status="unknown")
    do j = 1, __ROWS
        do i = 1, __COLUMNS
            write (__FILE_UNIT, fmt, advance="no") a(i, j)
        end do
        write (__FILE_UNIT, *) ""
    end do
    close(__FILE_UNIT)
    write (*, "(A)") "done."
end subroutine


! Case 1: Outer loop j, inner loop i
subroutine case1(a)
    real, intent(out):: a(__COLUMNS, __ROWS)
    integer:: i,j ! loop

    do j = 1, __ROWS
        do i = 1, __COLUMNS
            a(i, j) = compute(i, j)
        end do
    end do
end subroutine


! Case 2: Outer loop i, inner loop j
subroutine case2(a)
    real, intent(out):: a(__COLUMNS, __ROWS)
    integer:: i,j ! loop

    do i = 1, __COLUMNS
        do j = 1, __ROWS
            a(i, j) = compute(i, j)
        end do
    end do
end subroutine


! Case 3: Outer loop j, inner loop i, parallel do
subroutine case3(a)
    real, intent(out):: a(__COLUMNS, __ROWS)
    integer:: i,j ! loop
    !$OMP DO
    do j = 1, __ROWS
        do i = 1, __COLUMNS
            a(i, j) = compute(i, j)
        end do
    end do
    !$OMP END DO
end subroutine

! Case 4: Outer loop i, inner loop j, parallel do
subroutine case4(a)
    real, intent(out):: a(__COLUMNS, __ROWS)
    integer:: i,j ! loop
    !$OMP DO
    do i = 1, __COLUMNS
        do j = 1, __ROWS
            a(i, j) = compute(i, j)
        end do
    end do
    !$OMP END DO
end subroutine

! Compute something 
function compute(a, b) result (c)
    integer:: a,b
    integer:: i, j, k   ! Loop
    real:: c

    !c = a**b
    do i = 1, 1000000000
        do j = 1, 1000000000
            do k = 1, 1000000000
                c = 1/sqrt(sqrt(sqrt(real(a+b))))
            end do
        end do
    end do
end function

end program loop_speed
