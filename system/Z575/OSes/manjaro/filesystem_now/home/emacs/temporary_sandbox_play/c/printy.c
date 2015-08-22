#include <stdio.h>
#include <stdbool.h>
int main(int argc, char**argv){
  bool a=false;
  int b=1;

  printf("bool: %b\n",a);
  a=true;
  printf("bool: %b\n",a);
  printf("int as bool: %b\n",b);
  b=1;
  printf("int as bool: %b\n",b);
  b=2;
  printf("int as bool: %b\n",b);
  printf("bool as int: %d\n",a);
  a=false;
  printf("bool as int: %d\n",a);

  return 0;
}
