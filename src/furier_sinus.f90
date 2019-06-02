program sinus

    !add fftw
    use, intrinsic :: iso_c_binding
    implicit none
    include "fftw3.f03"

	!parameters
    integer, parameter :: n = 1500
    type(c_ptr) :: pf1, pf2

	real(16) :: v
    real(c_double), allocatable :: cin(:)
    complex(c_double_complex), allocatable :: cout(:)

    real(16) :: t = 0.0
    real(16) :: dt=10/real(n-1)
    integer::i
	integer,parameter :: seed = 12345

	allocate(cin(n))
    allocate(cout(n/2+1))
	call srand(seed)

	!create files
    open (unit = 1, file = "../res/sinTimeContaminated")
    open (unit = 2, file = "../res/sinFreqContaminated")
	open (unit = 3, file = "../res/sinTimeClear")
    open (unit = 4, file = "../res/sinFreqClear")
    open (unit = 5, file = "../res/sinTimeCleared")


    !contaminated sinus and clar sinus times
    do i=1,n
        t=t+dt
        write(3,*) t," ",sin(t)
        cin(i)=sin(t) + rand()-rand()
        write(1,*) t," ",0.001*cin(i)
    end do


    pf1 = fftw_plan_dft_r2c_1d(size(cin), cin, cout, FFTW_ESTIMATE+FFTW_UNALIGNED)
    pf2 = fftw_plan_dft_c2r_1d(size(cin), cout, cin, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(pf1, cin, cout)

	!contaminated and clear sinus frequencies
    do i=1,n/2+1
        v=abs(cout(i))
        if(v /= v)v=0.0
        write(2,'(I15," ", F15.10)')i, v
        if(abs(cout(i))<50) cout(i)=0.0
    end do

    do i=1,n/2+1
        write(4,'(I15," ", F15.10)')i, abs(cout(i))
    end do

    call fftw_execute_dft_c2r(pf2, cout, cin)

	!cleared sinus time
    t = 0.0
    dt=10/real(n-1)
    do i=1,n
        t=t+dt
        write(5,*) t," ",cin(i)/n

    end do


end program sinus
