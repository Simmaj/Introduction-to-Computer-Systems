#include <stdlib.h>
#include <stdio.h>

// YOU: Allocate these global variables, using these names
int  z, t;
int* y;
int  b[10];

int main (int argv, char** argc) {
  // Ignore this block of code
  if (argv != 11) {
    fprintf (stderr, "usage: b[0] ... b[9]\n");
    exit (EXIT_FAILURE);
  }
  for (int p=0; p<10; p++)
    b[p] = atol (argc[1 + p]);

  // YOU: Implement this code
  z  = b[4];
  z  = b[z];
  y  = &t;
  *y = 7;
  y  = &b[b[2]];
  *y = *y + b[5];

  // Ignore this block of code
  printf ("z=%d t=%d y=&b[%d] b={", z, t, y - b);
  for (int p=0; p<10; p++)
    printf("%d%s", b[p], p<9? ", ": "}\n");
  }
