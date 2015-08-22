#include <bsd/string.h>
#include <stdio.h>

int main() {
  printf("%d\n",strnstr("something","..",2));
  return 0;
}
