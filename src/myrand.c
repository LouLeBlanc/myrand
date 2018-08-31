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

void printVersion(char * progname)
{
  printf("%s Random Number Generator, version %s.\n",
         progname, MYRAND_VERSION);
}

/* Print usage to help the user along */
void usage(char * progname)
{
  printf("  Usage: \n");
  printf("\t%s [<INT>]\n", progname);
  printf("\t\tIf <INT> is omitted, %s returns a single random number.\n",
         progname);
  printf("\t\tIf <INT> is specified, %s returns <INT> random numbers.\n",
         progname);
  printf("\t\t<INT> must be an integer greater than 0.\n");
  printf("\t%s -h\n", progname);
  printf("\t\tDisplay help information for %s and exit\n", progname);
  printf("\t%s -v\n", progname);
  printf("\t\tDisplay version information for %s and exit\n", progname);
  return;
}

void failGracefully(char * progname)
{
  fprintf(stderr, "Invalid input value.\n");
  usage(progname);
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

      if (strcmp(inputNum, "-v") == 0)
        {
          printVersion(argv[0]);
          return 0;
        }
      else if (strcmp(inputNum, "-h") == 0)
        {
          usage(argv[0]);
          return 0;
        }
      else if (count < 1)
        {
          failGracefully(argv[0]);
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
