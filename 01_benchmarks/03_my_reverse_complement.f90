module Linked_list
    ! LINKED LIST DATA STRUCTURE  
    type:: List_t
        character(len=60):: line
        type(List_t), pointer:: next => null()
    end type List_t

    type:: List_ptr
        type(List_t), pointer:: p
    end type List_ptr
contains

    subroutine append_list(list, last, line)
        ! Append at the end of the list
        implicit none
        type(List_t), pointer, intent(in):: list
        type(List_t), pointer, intent(out):: last
        character(len=60), intent(in):: line
        type(List_t), pointer:: p
        integer:: i

        allocate(p)
        p%line = line
        last%next => p
        last => p
    end subroutine

    subroutine show_list(list)
        ! Show the list
        type(List_t), pointer, intent(in):: list
        type(List_t), pointer:: p
        integer:: file_out

        open(newunit=file_out, file="/dev/stdout", form="unformatted", access="stream")
        p => list
        do
            if (associated(p) .eqv. .false.) exit
            write(file_out) p%line
            p => p%next
        end do
    end subroutine show_list

end module Linked_list



! Main program 
program my_reverse_complement
    use iso_fortran_env, only:  input_unit, output_unit, error_unit, Int8
    use Linked_list
    implicit none

    integer(Int8), parameter :: iEndStr = iachar(">"), EOL=10
    integer:: file_in, file_out, file_in_status, file_out_status, i=1
    ! POINTERS FOR LINKED LIST
    type(List_t), pointer:: listI, lastI, listO, lastO
    type(List_t), pointer:: node
    ! IDEA: Crear un array con 10 nodos y que se lean los 10 de un tirón, es decir 10*60 caracteres
    type(List_ptr):: nodes(10)


    ! Program =============================================
    ! Create lists, both Input and Output
    allocate(listI, listO)
    lastI => listI
    lastO => listO

    ! Read the first line
    open(newunit=file_in, file="/dev/stdin", form="unformatted", access="stream")
    read(file_in, iostat=file_in_status) listI%line

    ! Read from second to last line
    do
        allocate(node)
        read(file_in, iostat=file_in_status) node%line
        if (IS_IOSTAT_END(file_in_status)) exit
        ! Append to list
        lastI%next => node
        lastI => node
    end do

    call show_list(listI)  ! 3.1 secs

end program my_reverse_complement

