#include <stdio.h>
#include <stdlib.h>

int main(void) {
  void *pMem = malloc(1024 * 1024 * 1024);
  if (pMem == NULL) {
    printf("no enough memory\n");
    return 1;
  }
  printf("yes enough memory\n");
  return 0;
}
