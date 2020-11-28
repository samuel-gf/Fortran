program allocate_many_arrays
   implicit none

   integer, allocatable, dimension(:):: a
   integer, parameter:: n_size = 100000, iterations = 1000
   integer:: i,j,k, counter, maxcounter

   counter = iterations
   do i=1, iterations
      do j = 1, iterations
         allocate(a(n_size))
         deallocate(a)
      end do
      counter = counter - 1
      print *, counter
   end do

   stop "Done"
end program allocate_many_arrays
