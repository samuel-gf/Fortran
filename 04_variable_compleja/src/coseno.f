program coseno
    complex w, z


    ! Entrada
    write (*, "(a)", advance="no") "Valor real de z: "
    read *, z%re
    write (*, "(a)", advance="no") "Valor imaginario de z: "
    read *, z%im

    ! Cálculos
    w = cos(z)


    ! Salida
    write (*,"(a)") "w=cos(z)"
    write (*,"(a,f4.2,sp,f5.2,a)") "z:", real(z), aimag(z), "i"
    write (*,"(a,f4.2,sp,f5.2,a)") "w:", real(w), aimag(w), "i"

end program coseno
