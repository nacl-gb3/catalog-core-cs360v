#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

__thread char bomb[16];

void *foo(void *args) {
  sleep(3);
  return NULL;
}

int main(int argc, char *argv[]) {
  pthread_t tid;

  if (pthread_create(&tid, NULL, &foo, NULL))
    printf("pthread_create() error\n");

  if (pthread_join(tid, NULL))
    printf("pthread_join() error\n");

  printf("success!\n");
  return 0;
}
