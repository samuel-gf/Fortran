program fact
    ! Ejemplo de uso de un factorial grande
    ! Primero hay que inicializarlo con la función init_factorial(limite, array)
    use iso_fortran_env
    use mod_dados

    real(real128), allocatable:: fac(:)

    ! General el array fac con los resultados de factoriales
    call init_factorial(1000, fac)

    ! Muestra el resultado en pantalla
    print *, fac(1000)

end program fact
