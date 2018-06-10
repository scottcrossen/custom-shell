# Basic Shell

A simple unix-type interactive shell

### Description

This repository is a mock shell program designed to run and handle execution of code in a unix-type environment. The
makefile provides functionality to compile the multi-build project into a single distributable and also test. A docker-build system is included for cross-platform development and isolation. It also faciliates the rebuilding process whenever a change is made to source files.

It is written and maintained by Scott Leland Crossen.

### Files

#### Base program

* Makefile    - Compiles your shell program and runs the tests
* README      - This file
* tsh.c       - The shell program that you will write and hand in
* tshref      - The reference shell binary.

#### The remaining files are used to test your shell

* sdriver.pl  - The trace-driven shell driver
* trace*.txt  - The 16 trace files that control the shell driver
* tshref.out  - Example output of the reference shell on all 16 traces

#### Little C programs that are called by the trace files

* myspin.c    - Takes argument <n> and spins for <n> seconds
* mysplit.c   - Forks a child that spins for <n> seconds
* mystop.c    - Spins for <n> seconds and sends SIGTSTP to itself
* myint.c     - Spins for <n> seconds and sends SIGINT to itself

### Contributors

1. Scott Leland Crossen  
<http://scottcrossen.com>  
<scottcrossen42@gmail.com>
