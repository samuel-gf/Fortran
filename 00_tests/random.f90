program random
   implicit none
   integer, parameter:: n=2    ! Personas
   integer, parameter:: max_dias = 2
   integer, parameter:: max_experimentos = 100
   character(len=4), parameter:: FORMATO1 = "(I2)"
   character(len=3), parameter:: FORMATO2 = "(A)"
   integer, dimension(max_dias):: d

   integer:: i, experimentos, dia_elegido, este_cumple
   real:: r, cumple = 0

   do experimentos = 1, max_experimentos
      ! Poner a 0 el array
      do i = 1, size(d)
         d(i) = 0
      end do

      ! Generar los nacimientos en el calendario
      do i = 1, n
         call random_number(r)
         dia_elegido = int(r*max_dias)+1
         d(dia_elegido) = d(dia_elegido) + 1
      end do

      ! Mostrar este array
      este_cumple = 0
      do i = 1, size(d)
         write (*,FORMATO1,advance="no") d(i)
         if (d(i) > 1) then
            cumple = cumple + 1
            este_cumple = 1
         end if
      end do
      if (este_cumple == 1) then
         write (*,FORMATO2,advance="no") " *"
      end if
      write (*,*) ""
   end do  ! experimentos

   print *, "Cumplen ", int(cumple), "de un total de ", experimentos-1
   print *, "Así que la probabilidad es ", cumple/experimentos

end program random
