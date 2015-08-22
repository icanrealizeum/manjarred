
# int(n)
prime(n) = sum [i=1:int(sqrt(n))] ( (i==1 ? _result = 0 : _result = _result + (int(n)%i==0 ? 1 : 0)) , ( i==int(sqrt(n)) && _result < 1 ? 1 : 0 ))

# n
primes(n) = sum [i=2:int(n)] prime(i)

set logscale xy
plot "integers.dat" using 1:(primes($1)), x/log(x)

