# Fortran-zad-2
Zadanie drugie z fortrana - FFTW

1) Generujemy sygnał sin(2*3.1415*t*50) (f = 50Hz) oraz dodajemy do niego sygnał o wyższej częstotliwości 2*sin(2*3.1415*t*150)/5 ze zmniejszoną amplitudą (f = 150Hz Amplituda jet równa 1/5 amplitudy sygnału głównego).

W ten sposób otrzymamy zniekształcony sygnał

Wygenerowany zniekształcony sygnał: 
![alt text](https://github.com/Satoszi/Fortran-zad-2/blob/master/res/Time_Chart.png)

Następnie wykonujemy transformatę fouriera na zniekształconym sygnale, otrzymując wykres amplitudy od częstotliwości. Możemy na nim zauważyć z jakich sygnałów złożony jest sygnał wypadkowy:

![alt text](https://github.com/Satoszi/Fortran-zad-2/blob/master/res/Freq_Chart.png)

Na wykresie widać, że sygnał składa się z tych samych składowych, które podaliśmy na początku, generując sygnał.

2)

Na początku generujemy sygnal sinusoidalny (f(t)=sin(2πt)), a następnie zniekształamy go za pomocą losowych wartości. Tym razem sygnał nie będzie złożony z dwóch sygnałów sinusoidalnych, lecz z jednego sygnału sinusoidalnego oraz szumu.

Sygnał sinusoidalny zniekształcony za pomocą loswych wartości:

![alt text](https://github.com/Satoszi/Fortran-zad-2/blob/master/res/Time_Chart_Signal.png)

Następnie wykonujemy transformatę fouriera, aby wyodrębnic składowe częstotliwości z wykresu:

![alt text](https://github.com/Satoszi/Fortran-zad-2/blob/master/res/Freq_Chart_Singal.png)

Teraz usuwamy wszystkie wartości mniejsze od 50 z wykresu fouriera:

![alt text](https://github.com/Satoszi/Fortran-zad-2/blob/master/res/sig_Freq_Clear.png)

a nastepnie działamy odwrotnie do poprzedniego kroku, czyli wykonujemy odwrotną transformatę fouriera po przeflitrowaniu sygnału. 

Nasz sygnał sinusoidalny po przefiltrowaniu wygląda w ten sposób:

![alt text](https://github.com/Satoszi/Fortran-zad-2/blob/master/res/Filtered_signal.png)

Jak widać "odzyskany" sygnał nie jest identyczny, ale pomimo to jest dośc podobny do sinusoidy, poza tym udało sie pozbyć szumu.
