program tipo_datos
   use, intrinsic:: iso_fortran_env

   ! Tipos: Crea tipo de datos de precisión 15 y rango de exponente 10
   integer, parameter:: Tipo_N = selected_real_kind(15, 10)
   integer, parameter:: Maximo = 100   ! Constante
   type persona
      character(len = 6)::  id
      character(len = 10):: nombre
      real::              edad
   end type persona

   ! Variables: Crea una variable de tupo Tipo_N
   real(kind = Tipo_N):: s = 1  ! Suma
   integer:: i               ! Índice
   type(persona):: p

   ! Programa-------------------------------------------
   p%id = "474938"
   p%nombre = "Pablo"
   p%edad = 40

   do i = 1, Maximo
      s = s*i
      print *, s
   end do


end program
