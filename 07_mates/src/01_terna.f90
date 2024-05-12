! Busca ternas pitagóricas
! Acepta un parámetro por línea de comandos para buscar entre todos
! los enteros comprendidos entre 1 y max
program terna_pitagorica
    use iso_fortran_env
    implicit none

    integer :: max
    integer :: a, b, c, ios
    integer :: argc
    character(len=10) :: argv

    ! Tratar los parámetros
    argc = command_argument_count()
    if (argc /= 1) then
        write(error_unit,*) "Error de uso: Falta el parámetro"
        write(error_unit,*) "$ 01_terna_pitagorica <max>" 
        stop 1
    end if
    call get_command_argument(1, argv)
    read(argv,*,iostat=ios) max
    if (ios .ne. 0) then
        write(error_unit,*) "Error de uso: Argumento «", trim(argv), "» no es un número"
        stop 2
    end if

    ! Comprobar si (a,b,c) es terna pitagórica
    !$OMP parallel do private(a, b, c)
    do a=1, max
        do b=a+1, max
            do c=b+1, max
                if (a**2+b**2 .eq. c**2) then
                    write(*,'(3i8)') a, b, c
                end if
            end do
        end do
    end do
    !$OMP end parallel do

end program terna_pitagorica
