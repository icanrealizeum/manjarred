
#for gnuplot

# int(n)
prime(n) = sum [i=1:int(sqrt(n))] \
    ( (i==1 ? _result = 0 : _result = _result + (int(n)%i==0 ? 1 : 0)) , \
    ( i==int(sqrt(n)) && _result < 1 ? 1 : 0 ))

# n
primes(n) = sum [i=2:int(n)] prime(i)

set xrange [0:1000]
set samples 1001
plot primes(x)

