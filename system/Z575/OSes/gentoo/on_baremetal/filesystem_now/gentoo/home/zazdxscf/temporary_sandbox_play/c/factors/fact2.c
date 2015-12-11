//src: https://stackoverflow.com/questions/11699324/algorithm-to-find-all-the-exact-divisors-of-a-given-integer
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

unsigned int FindDivisors(unsigned long long divisors[], unsigned long long N) {
    unsigned int lastdiv = 0;
    divisors[lastdiv++] = 1;
    unsigned long long powerfactor = 1;
    unsigned long long number = N;
    while ((number & 1) == 0) {
        powerfactor <<= 1;
        divisors[lastdiv++] = powerfactor;
        number >>= 1;
    }

    unsigned long long factor = 3; unsigned long long upto = lastdiv;
    powerfactor = 1;
    while (factor * factor <= number) {
        if (number % factor == 0) {
            powerfactor *= factor;
            for (unsigned int i = 0; i < upto; i++)
                divisors[lastdiv++] = divisors[i] * powerfactor;
            number /= factor;
        }
        else {
            factor += 2; upto = lastdiv;
            powerfactor = 1;
        }
    }

    if (number > 1) {
        if (number != factor) {
            upto = lastdiv;
            powerfactor = 1;
        }
        powerfactor *= number;
        for (unsigned int i = 0; i < upto; i++)
            divisors[lastdiv++] = divisors[i] * powerfactor;
    }
    return lastdiv;
}

int cmp(const void *a, const void *b) {
    if( *(long long*)a-*(long long*)b < 0 ) return -1;
    if( *(long long*)a-*(long long*)b > 0 ) return 1;
    return 0;
}

int main(int argc, char *argv[]) {
    unsigned long long N = 2;
    unsigned int Ndigit = 1;
    if (argc > 1) {
        N = strtoull(argv[1], NULL, 10);
        Ndigit = strlen(argv[1]);
    }
    unsigned int maxdiv[] = {1, 4, 12, 32, 64, 128, 240, 448, 768, 1344,
                             2304, 4032, 6720, 10752, 17280, 26880, 41472, 64512, 103680};

    unsigned long long divisors[maxdiv[Ndigit]];
    unsigned int size = FindDivisors(divisors, N);
    printf("Number of divisors = %u\n", size);

    qsort(divisors, size, sizeof(unsigned long long), cmp);
    for (unsigned int i = 0; i < size; i++)
        printf("%llu ", divisors[i]);
    printf("\n");

    return 0;
}
