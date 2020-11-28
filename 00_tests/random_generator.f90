#define MAX 1000

program random_generator
   implicit none
   integer:: i,j ! Loop
   integer, parameter:: dp=kind(0.d0)
   integer, parameter:: t_test=kind(0.1)

!$OMP do
   do i = 2, MAX
      !write (*,"(F8.6)") rnd(i)
      print *, i
   end do
!$OMP end do

contains


   real(dp) function rnd(n) result(r)
      integer:: n

      r = real(n)
      r = sqrt(real(106*n**2 + 94*n + 25))
      r = r - int(r)
   end function

end program random_generator
