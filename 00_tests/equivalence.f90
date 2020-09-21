program equivalence
    implicit none

    integer(kind=1):: a(10)
    character(len=10):: b

    equivalence(b,a)

    b = "0123456789"
    a = 48
    print *, a
    print *, "-------"
    print *, b

end program equivalence
