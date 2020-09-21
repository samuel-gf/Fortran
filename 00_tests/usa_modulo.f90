program usa_modulo
use factorial
real(kind=8):: a(40)

! Método 1
print *, fact(40)

! Método 2
call factorial_vector(40, a)
print *, a(40)


end program usa_modulo
