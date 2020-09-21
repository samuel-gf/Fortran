program write_test
    use, intrinsic :: iso_fortran_env
    implicit none

    integer:: file_id, i 
    real:: time_fast(0:1), time_slow(0:1)
    integer, parameter:: iterations = 5e7
    character(len=7), parameter:: s = "Fortran"

    !-----------------------------------------------
    ! Faster procedure
    !-----------------------------------------------
    call cpu_time(time_fast(0))
    open(newunit=file_id, file="/dev/stdout", form="unformatted", access="stream")
    do i = 1, iterations
        write (file_id) s
    end do
    close(file_id)
    call cpu_time(time_fast(1))

    ! ----------------------------------------------
    ! Slower procedure
    ! ----------------------------------------------
    call cpu_time(time_slow(0))
    open(unit=output_unit)
    do i = 1, iterations
        write (output_unit, "(a)") s
    end do
    call cpu_time(time_slow(1))

    ! ----------------------------------------------
    ! Show results
    ! ----------------------------------------------
    print *, "TIME fast procedure: ",time_fast(1)-time_fast(0)
    print *, "TIME slow procedure: ",time_slow(1)-time_slow(0)
end program write_test
