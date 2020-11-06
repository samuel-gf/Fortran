program Tipos_iso
    use iso_fortran_env
    integer, parameter:: N = 3
    real(real64):: A(N, N)
    integer(int64):: B(N, N)

    A = .0_real64   ! Matriz de ceros
    B = 0_int64     ! Matriz de ceros

    write (*,"(3f6.1)") A
    write (*,"(3i6)") B
end program Tipos_iso
