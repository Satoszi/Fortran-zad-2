program signals_sum

    use, intrinsic :: iso_c_binding
    implicit none
    include "fftw3.f03"


	!variables initializing
    integer, parameter :: n = 1500
    type(c_ptr) :: pf

    real(16) :: t = 0.0
    real(16) :: dt=1/real(n-1)
    real(16) :: v
    integer::i

    !streams creating
    real(c_double), allocatable :: cin(:)
    complex(c_double_complex), allocatable :: cout(:)


	!Opening files
    open (unit = 1, file = "../res/TimeChart")
    open (unit = 2, file = "../res/FreqChart")
    allocate(cin(n))
    allocate(cout(n/2+1))

	!Signal generating
    do i=1,n

        t=t+dt
        cin(i)=sin(2*3.1415*t*50)+2*sin(2*3.1415*t*150)/5
    !Writing to file
        write(1,*) t," ",cin(i)

    end do

	!making fas fourier
    pf = fftw_plan_dft_r2c_1d(size(cin), cin, cout, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(pf, cin, cout)

	!write frequency to file
    do i=1,n/2+1

        v=abs(cout(i))
        if(v /= v)v=0.0
        write(2,'(I15," ", F15.10)')i, v

    end do


end program signals_sum
