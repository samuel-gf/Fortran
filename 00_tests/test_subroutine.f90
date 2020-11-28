program test_subroutine
   implicit none

   integer, parameter :: n_size = 10   ! Size of vector
   real, dimension(n_size):: a,b       ! Vectores
   character(len=10) :: FMT1           ! Formato 1/2
   write (FMT1,"(A,I2,A)") "(A," , n_size, "F6.2)" ! Formato 2/2

   ! Setup
   a = 1
   b = 2

   ! Proceso
   call proceso(a, b, 10)
   print FMT1, "A", a
   print FMT1, "B", b
end program test_subroutine

! ---------------------------------------------------------------------
! a,b son vectores de dimensión n
subroutine proceso(a, b, n)
   real, dimension(10), intent(in out):: a,b
   integer, intent(in):: n

   a = 3.2 * b
   b = 1.7 * a
end subroutine
