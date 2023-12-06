module mod_utils
implicit none

! https://cs.ubishops.ca/ljensen/fortran/pointer.htm
type:: t_node
    character(len=12):: val
    type(t_node), pointer:: next => null()
end type

type::t_list
    type(t_node), pointer:: first => null()
    type(t_node), pointer:: last => null()
end type


contains

subroutine list_add_node_at_end(list, val)
    character(len=*), intent(in):: val
    type(t_node), pointer::node
    type(t_list):: list


    allocate(node)
    node %val = val
    if (associated(list %first) .eqv. .false.) then
        list %first => node
        list %last => node
    else
        list %last %next => node
        list %last => node
    end if
end subroutine 

subroutine list_remove(list, val)
    type(t_list)::list
    character(len=*), intent(in):: val
    type(t_node), pointer:: p1, p2

    p1 => list %first
    p2 => p1

    if (list %first %val .eq. val) then
        ! The item to be removed is the first
        if (associated(list %first %next) .eqv. .true.) then
            ! There are more after the first item
            p1 => list %first
            list %first => list %first %next
            deallocate(p1)
        else 
            ! There is only one item in the list
            deallocate(list %first)
        end if

    else
        ! The item to be removed is not the first
        p1 => list %first
        p2 => list %first %next
        do while(trim(p2 %val) .ne. trim(val))
            p1 => p2
            if (associated(p2 %next) .eqv. .false.) exit
            p2 => p2 %next
        end do
        p1 %next => p2 %next
        deallocate(p2)
    end if
end subroutine

subroutine list_show(list)
    type(t_node), pointer:: p
    type(t_list)::list

    ! If it is an empty list exit
    if (associated(list %first) .eqv. .false.) return

    p => list %first
    print *, p %val
    do while(associated(p %next) .eqv. .true.)
        p => p %next
        print *, p %val
    end do
end subroutine

!function list_new_node(val) result(node)
!    character(len=*), intent(in):: val
!    type(t_node), pointer::node
!
!    allocate(node)
!    node %val = val
!    node %next => null()
!end function 

end module mod_utils
