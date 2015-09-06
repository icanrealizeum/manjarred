#include <stdio.h>

#define moo(type, str) \
  fprintf(stderr, " abc " # type " cde %s\n", str);


#define one(str) \
  moo(one, str);

void main() {
  one("wonder");
}
