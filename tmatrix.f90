module tmatrix
    use scattering_functions
    use communication
    use constants
    use iso_c_binding, only: C_FLOAT128, C_FLOAT128_COMPLEX, C_INT32_T
    implicit none
contains

    subroutine get_spheroidal_tmatrix(ab, rv, lambda, lnum, ri, m, res)
        real(C_FLOAT128) :: ab, rv, lambda
        integer(C_INT32_T) :: lnum, m, f, i, j
        type(ScatteringResult) :: response
        complex(C_FLOAT128_COMPLEX) :: ri, res(2*lnum, 2*lnum)

        write(*,*) 'fortran ab = ', ab, 'rv = ', rv, 'lambda = ', lambda, 'lnum = ', lnum, &
                'ri = ', ri, 'm = ', m
        f = 1
        if (ab < 1.0q0) then
            f = -1
            ab = 1q0 / ab
        end if

        response = GetSphericalTmatrix(f, 1, (/2.0q0 * PI * rv / lambda/), (/ab/), 0.5q0, &
                lambda, &
        (/ (1q0, 0q0), ri/), lnum, m, m)
!        write(*,*) 'fortran result:'
!        do i = 1, 2*lnum
!            write(*,*) response%result_spherical_tm%uv_tmatrix(i,:,m)
!        end do
        res = transpose(response%result_spherical_tm%uv_tmatrix(:,:,m))
        deallocate(response%result_spherical_tm%uv_tmatrix, response%result_spherical_te%uv_tmatrix)
    end subroutine get_spheroidal_tmatrix
end module tmatrix