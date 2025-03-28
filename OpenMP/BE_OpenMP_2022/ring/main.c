#include "aux.h"
#include "omp.h"


int main(int argc, char **argv){
  long t_start, t_end;
  int  l, t, L, T;
  Token token;
  
  if ( argc == 3 ) {
    L = atoi(argv[1]);    /* number of loops */
    T = atoi(argv[2]);    /* number of threads */
  } else {
    printf("Usage:\n\n ./main L T\n\nsuch that L is the number of loops and T the number of threads to use.\n");
    return 1;
  }

  init(&token, L, T);

  omp_lock_t lock_thread;
  omp_lock_t lock_loop;
  omp_init_lock(&lock_thread);
  omp_init_lock(&lock_loop);

  #pragma omp parallel private(l,t) num_threads(T)
  {
  
    for(l=0; l<L; l++){
      //omp_set_lock(&lock_loop);
      #pragma omp single
      printf("Loop %2d\n",l);
      for(t=0; t<T; t++)
        {
          //omp_set_lock(&lock_thread);
          if(t==omp_get_thread_num()) process(&token);
          //omp_unset_lock(&lock_thread);
          #pragma omp barrier
        }
      
      //omp_unset_lock(&lock_loop);
    }
  
  }

  omp_destroy_lock(&lock_loop);
  omp_destroy_lock(&lock_thread);

  check(&token, L, T);

  
  return 0;
}
