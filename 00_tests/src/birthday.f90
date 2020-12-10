program birthday
   implicit none

   integer, parameter:: n_days = 365
   integer:: n_people                          ! loop
   real(kind=16):: arr_factorial(n_days)
   real:: p

   call compute_factorial(arr_factorial, n_days)

   do n_people = 1, 100
      p = 1 - arr_factorial(n_days) / (real(n_days, 16) ** n_people * arr_factorial(n_days-n_people))
      write (*,"(i4,a2,f6.2,a1)") n_people, ": ", p*100, "%"
   end do

end program birthday


! -------------------------------
subroutine compute_factorial(arr_factorial, n_days)
   integer, intent(in):: n_days
   real(kind=16), intent(out):: arr_factorial(n_days)
   integer i

   arr_factorial(1) = 1
   do i = 2, n_days
      arr_factorial(i) = arr_factorial(i-1)*i
   end do
end subroutine
