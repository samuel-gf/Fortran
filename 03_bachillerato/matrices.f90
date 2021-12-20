program matrices
    implicit none

    integer, dimension(5,5):: G, G2, Gs, G3
    integer:: i, j

    G = reshape((/0,1,0,1,1,0,0,1,0,0,1,0,0,0,1,0,1,1,0,1,0,1,0,0,0/), shape(G))
    G2 = matmul(G,G)
    G3 = matmul(G2, G) + G2 + G
    Gs = G + G2

    do i = 1, 5
        do j = 1, 5
            write (*,"(i2)", advance="no") G3(j,i)
        end do
        write (*,*) " "
    end do


end program matrices
