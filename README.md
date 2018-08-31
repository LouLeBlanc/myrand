# myrand
Random number generator in RPM packaging

The myrand utility is a small program written in C that generates random numbers on the command line.
By default, a single random integer is generated, but if an integer is passed in, myrand will generate
the specified number of random integers.
<pre>
  Usage:
    myrand [<INT>]
      If <INT> is omitted, myrand returns a single random number.
      If <INT> is specified, myrand returns <INT> random numbers.
      <INT> must be an integer greater than 0.
    myrand -h
      display help information for myrand and exit.
    myrand -v
      display version information for myrand and exit.

  Return Values
    0                success
    EXIT_FAILURE     invalid input
    errno            System error
</pre>
