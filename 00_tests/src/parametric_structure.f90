program parametric_structure
    type :: body_p(k, n)                ! Estructura paramétrica template
        integer, kind :: k = kind(1.0)    ! Tipo
        integer, len ::   n = 1           ! Número

        character(len=4) :: units
        real(kind=k) :: mass(n)
        real(kind=k) :: pos(n,3),   vel (n,3)
    end type body_p

type(body_p(n=:)), allocatable ::  vector
allocate(body_p(n=20) :: vector)

vector % mass(1) = 0.1

end program parametric_structure
