program slice
    implicit none

    character(len=:), allocatable:: s(:)
    integer:: i

    ! SETUP -----------
    allocate(character(len=12):: s(10))

    ! PROGAM -----------
    do i = 1, 4
        s(i) = "Hola mundo" 
    end do
    print *, s

end program slice
