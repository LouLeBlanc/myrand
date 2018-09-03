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
#include <string.h>
#include <time.h>
#include <ctype.h>

#include "myrand.h"

/* Print usage to help the user along */
void usage()
{
  printf("  Usage: \n");
  printf("\tmyrand [<count>]\n" );
  printf("\t\tIf <count> is omitted, myrand returns a single random number.\n");
  printf("\t\tIf <count> is specified, myrand returns <count> random numbers.\n");
  printf("\t\t<count> must be an integer greater than 0.\n");
  printf("\tmyrand -h\n");
  printf("\t\tDisplay help information for myrand and exit\n");
  return;
}

void failGracefully()
{
  fprintf(stderr, "Invalid input value.\n");
  usage();
  exit(EXIT_FAILURE);
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
      count = 0;

      if (isdigit(inputNum[0]))
        count = atoi(argv[1]);

      if (strcmp(inputNum, "-h") == 0)
        {
          usage();
          return 0;
        }
      else if (count < 1)
        {
          failGracefully();
        }
    }

  srandom(time(NULL));
  for (i = 0; i < count; i++)
    {
      int randomNumber = (random() % MYRAND_MAX);
      printf("%8d", randomNumber);
      cols++;
      /* Print 8 columns */
      if (cols >= 8)
        {
          cols = 0;
          printf("\n");
        }
    }

  /* Only add a newline if we didn't just print one. */
  if (cols > 0)
    printf("\n");

  exit(EXIT_SUCCESS);
}
