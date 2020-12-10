program allocatable_array
    integer, allocatable:: a(:)
    integer:: i

    a = [integer::]

    a = [(i, i=1,10)]

    print *, a
end program allocatable_array
