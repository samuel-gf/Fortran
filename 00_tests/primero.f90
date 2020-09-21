program prueba
   ! Configuración
   real :: a, b, c

   ! Lectura de los datos
   print *, "Catetos a y b:"
   read *, a, b
   print *, "Cateto a=", a, " b=", b

   ! Salida de datos
   c = sqrt(a**2 + b**2)
   print *, "Hipotenusa ", c
end program prueba
