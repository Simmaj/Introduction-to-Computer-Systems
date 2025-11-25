#include <stdlib.h>
#include <stdio.h>

int *val;

void sort (int n) {
  int t;
  for (int i=n-1; i>0; i--)
    for (int j=i-1; j>=0; j--)
      if (*(val+i) < *(val+j)) {
        t = *(val+i);
        *(val+i) = *(val+j);
        *(val+j) = t;
      }
}

int main (int argc, char** argv) {
  char* ep;
  int   n;

  n = argc - 1;
  

  val = malloc(n * sizeof(*val));
  
  if (val == NULL && n > 0) {
      fprintf(stderr, "Error: Memory allocation failed.\n");
      return -1;
  }

  for (int i=0; i<n; i++) {
    *(val+i) = strtol( *(argv+(i+1)), &ep, 10);
    if (*ep) {
      fprintf(stderr, "Error: Argument %d ('%s') is not a valid integer.\n", i + 1, *(argv+(i+1)));
      free(val); 
      return -1;
    }
  }

  sort(n);

  for (int i=0; i<n; i++)
    printf("%d\n", *(val+i));

  free(val);

  return 0;
}