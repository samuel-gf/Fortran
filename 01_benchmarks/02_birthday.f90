!! ## The data structure
!!
!! This is the vector `v`. Its size is equal to the number of people in the planet. 
!! Each item in the *vector* represents the day each person was born. So
!!```
!! Person:          1     2     3     4     5
!!               -------------------------------
!! Vector:: v    |  1  |  4  |  1  |  7  |  6  |
!!               -------------------------------
!!                  ^     ^     ^     ^     ^
!!                      Day of birthday
!!
!! size(v) == n_people
!! v(1) == Day of the year in which person 1 was born
!! v(2) == Day of the year in which person 2 was born
!! ...
!! v(n) == Day of the year in which person 'n' was born
!!
!! The numbers in the vector are in the range `1...n_days`
!!
!!```
!!
!!
!!
!! ## The process
!!
!! It consists in testing all combinations in the vector `v` and test if there are two or more
!! people who were born the same day.
!!
!! More information in my (github)[https://github.com/profesors/Fortran/tree/master/01_benchmarks]

program birthday
    implicit none
    integer, parameter:: n_days = 100, n_people = 5
    integer(kind=8), parameter:: total = int(n_days,8) ** n_people
    integer(kind=8):: i, j, n_coincidences
    integer:: percent
    integer:: v(n_people)
    character(len=30):: format_iteration_omp, format_iteration_single

    ! Setup variables
    v = 1   ! v is a vector. `v(n)` means number of day when `n` was born
    n_coincidences = 0
    percent = 0
    write (format_iteration_omp, *) "(", n_people, "i4, a, i2)"
    write (format_iteration_single, *) "(", n_people, "i4)"

    ! Process: Test all combination in the vector v
    do j= 1, total, total/100
        do i = j, j+(total/100)-1
            if (same_day(v, n_people)) then
                n_coincidences = n_coincidences + 1
            end if
            !write (*, format_iteration_single) v
            call next_iteration(v, n_people, n_people, n_days)
        end do
        percent = percent + 1
        print *, percent, "%"
    end do

    ! Show results
    write (*,"(a,i10,a,i11,a,f5.2,a)") "Coincidences ", n_coincidences, &
        " / ", total, " = ", real(n_coincidences)/total*100,"%"


contains


recursive subroutine next_iteration(v, p, n_people, n_days)
    ! Next iteration in the vector `v` of birthdays
    integer, intent(in):: p, n_people, n_days ! `p` is the index position that must be increased
    integer, intent(inout):: v(n_people)      ! `v` is the vector with birthdays
    
    if (p < 1) then    
        return
    else if (v(p) .ne. n_days) then
        v(p) = v(p) + 1
    else
        v(p) = 1
        call next_iteration(v, p-1, n_people, n_days)
    end if
end subroutine next_iteration



logical pure function same_day(v, n_people) result(ret)
    ! Are there two people who where born the same day?
    integer, intent(in):: n_people
    integer, intent(in):: v(n_people)
    integer:: i, j

    ret = .false.
    do i = 1, n_people-1
        do j = i+1, n_people
            if (v(i) == v(j)) then   ! There are two people who were born same day
                ret = .true.
                return                  
            end if 
        end do
    end do
end function

end program birthday
