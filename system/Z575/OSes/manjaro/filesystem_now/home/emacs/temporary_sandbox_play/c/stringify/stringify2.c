#include <stdio.h>

#define moo(type, str) \
  fprintf(stderr, " abc " # type " cde %s\n", str);

#define moo2(type, str) \
  fprintf(stderr, " abc " STR_HELPER(type) " cde %s\n", str);

#define too 2
#define two(str,a) \
  moo( a, str);

//src: https://stackoverflow.com/questions/5459868/c-preprocessor-concatenate-int-to-string
//The extra level of indirection will allow the preprocessor to expand the macros before they are converted to strings.
#define STR_HELPER(x) #x
#define three(str) \
  moo2( too, str )

#define one(str) \
  moo(one, str);

void main() {
  one("wonder");
  two("wonder", a);
  three("wonder");
}
