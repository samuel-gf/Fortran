module Linked_list
    ! LINKED LIST DATA STRUCTURE  
    type:: List_t
        character(len=60):: chars
        type(List_t), pointer:: next => null()
    end type List_t

contains
    subroutine create_list(list)
        implicit none
        type(List_t), pointer, intent(out):: list
        type(List_t), pointer:: p_pre, p_current
        integer:: i

        ! Create the list
        allocate(list)
        list%chars = "A"
        p_pre => list
        p_current => list%next
        do i = 1, 10
            allocate(p_current)
            p_current%chars = char(65 + i)
            p_pre%next => p_current
            p_pre => p_current
            p_current => p_current%next
        end do
    end subroutine create_list
end module Linked_list

