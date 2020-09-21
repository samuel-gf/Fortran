program coarrays
    implicit none

    integer:: d(10)[*]
    integer:: i, j, img

    do
        if (this_image() == 1) call produce()
        sync all
        write (*,"(i2,a2,10i1)") this_image(), ": ", d
        call sleep(1)
    end do

contains
    subroutine produce()
        integer:: i, img
        real:: r
        call random_number(r)
        img = floor(r*num_images())+1
        do i = 1, 10
            d(i)[img] = 1
        end do
        print *, ""
    end subroutine
end program coarrays
