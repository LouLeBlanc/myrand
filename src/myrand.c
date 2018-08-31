/* 
 * Written by Louis LeBlanc
 * For Homework Assignment 5
 * Release Control and Continuous Integration/Continuous Delivery
 * Brandeis University,
 * Instructed by Eric Hemdal
 * 
 * Basic random number generator.
 * 
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>

/* Print usage to help the user along */
void usage(char * progname)
{
  printf("%s [<INT>]\n", progname);
  printf("\tIf <INT> is omitted, %s returns a single random number\n", progname);
  printf("\tIf <INT> is specified, %s returns <INT> random numbers\n", progname);
  return;
}

/* Main process */
int main (int argc, char *argv[])
{
  unsigned int count = 1;
  unsigned int i = 0;
  unsigned int cols = 0;

  if (argc > 1)
    {
      char * inputNum = argv[1];

      if (isalpha(inputNum[0]))
        {
          usage(argv[0]);
          return 0;
        }

      if (isdigit(inputNum[0]))
        count = atoi(argv[1]);
    }

  srandom(time(NULL));
  for (i = 0; i < count; i++)
    {
      int randomNumber = (random() % 10000);
      printf("%8d", randomNumber);
      cols++;
      /* Print 8 columns */
      if (cols >= 8)
        {
          cols = 0;
          printf("\n");
        }
    }
  printf("\n");
}
