# myrand
### Random number generator in RPM packaging

---

### Website
<a href="https://github.com/LouLeBlanc/myrand">https://github.com/LouLeBlanc/myrand</a>

The myrand utility is a small program written in C that generates random numbers on the command line.
By default, a single random integer is generated, but if an integer is passed in, myrand will generate
the specified number of random integers.

```
  Usage:
    myrand [<count>]
      If <count> is omitted, myrand returns a single random number.
      If <count> is specified, myrand returns <count> random numbers.
      <count> must be an integer greater than 0.
    myrand -h
      display help information for myrand and exit.
    myrand -v
      display version information for myrand and exit.

  Return Values
    0                success
    EXIT_FAILURE     invalid input
    errno            System error
```

### TODO
- Add a command line option to specify the upper bound for random integers  
- Add a command line option to specify the lower bound for random integers  

