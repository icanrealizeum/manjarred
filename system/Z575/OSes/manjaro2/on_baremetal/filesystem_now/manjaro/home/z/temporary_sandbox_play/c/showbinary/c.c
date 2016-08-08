#include <stdio.h>
//src: https://stackoverflow.com/questions/111928/is-there-a-printf-converter-to-print-in-binary-format
void print_binary(int number)
{
    if (number) {
        print_binary(number >> 1);
        putc((number & 1) ? '1' : '0', stdout);
    }
}

int main() {
  print_binary( (1<<6) | (1<<7) | (1 << 9));
  printf("\n");
  print_binary( 3);
  printf("\n");
  print_binary( (3 << 6) );
  printf("\n");
  print_binary( (1 << 6) );
  printf("\n");
}
