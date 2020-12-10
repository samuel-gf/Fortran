program selected_kind
   integer, parameter:: k5 = selected_int_kind(5)
   integer(kind=k5):: i5
   integer, parameter:: k10 = selected_int_kind(10)
   integer(kind=k10):: i10

   print *, huge(i5)
   print *, huge(i10)
end program selected_kind
