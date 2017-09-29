# Makefile by Scott Leland Crossen
# @Copyright 2017 Scott Leland Crossen

# ==== Definitions ====

BYUNETID = slxn42
VERSION = 1
HANDINDIR = /users/faculty/snell/CS324/handin/Fall2017/Shell
BINDIR = bin
SOURCEDIR = source
RELDIR = rel
DRIVER = ./test/sdriver.pl
TSH = ${RELDIR}/tsh
TSHREF = ./test/tshref
TSHARGS = "-p"
OBJS =
COMP = gcc
OBJS = $(TSH) ${RELDIR}/myspin ${RELDIR}/mysplit ${RELDIR}/mystop ${RELDIR}/myint
COMPFLAGS = -Wall -O2
LINKFLAGS =

# ==== Recipes ====

.PHONY: default
.DEFAULT: default
default: all

.PHONY: all
all: $(OBJS)

.PHONY: handin
handin:
	yes | cp -rf tsh.c $(HANDINDIR)/$(BYUNETID)-$(VERSION)-tsh.c

.PHONY: clean
clean:
	rm -rf $(BINDIR) $(RELDIR)

# ==== Targets ====

.PRECIOUS: ${BINDIR}/%.o
${BINDIR}/%.o: ${SOURCEDIR}/%.c
	mkdir -p $(@D)
	$(COMP) -c $< -o $@ $(COMPFLAGS)

.PRECIOUS: ${RELDIR}/%
${RELDIR}/%: ${BINDIR}/%.o
	mkdir -p $(@D)
	$(COMP) $^ -o $@ $(LINKFLAGS)

# ==== Regression Tests ====

# Run tests using the custom shell program
test01: $(TSH)
	$(DRIVER) -t ./test/cases/trace01.txt -s $(TSH) -a $(TSHARGS)
test02: $(TSH)
	$(DRIVER) -t ./test/cases/trace02.txt -s $(TSH) -a $(TSHARGS)
test03: $(TSH)
	$(DRIVER) -t ./test/cases/trace03.txt -s $(TSH) -a $(TSHARGS)
test04: $(TSH)
	$(DRIVER) -t ./test/cases/trace04.txt -s $(TSH) -a $(TSHARGS)
test05: $(TSH)
	$(DRIVER) -t ./test/cases/trace05.txt -s $(TSH) -a $(TSHARGS)
test06: $(TSH)
	$(DRIVER) -t ./test/cases/trace06.txt -s $(TSH) -a $(TSHARGS)
test07: $(TSH)
	$(DRIVER) -t ./test/cases/trace07.txt -s $(TSH) -a $(TSHARGS)
test08: $(TSH)
	$(DRIVER) -t ./test/cases/trace08.txt -s $(TSH) -a $(TSHARGS)
test09: $(TSH)
	$(DRIVER) -t ./test/cases/trace09.txt -s $(TSH) -a $(TSHARGS)
test10: $(TSH)
	$(DRIVER) -t ./test/cases/trace10.txt -s $(TSH) -a $(TSHARGS)
test11: $(TSH)
	$(DRIVER) -t ./test/cases/trace11.txt -s $(TSH) -a $(TSHARGS)
test12: $(TSH)
	$(DRIVER) -t ./test/cases/trace12.txt -s $(TSH) -a $(TSHARGS)
test13: $(TSH)
	$(DRIVER) -t ./test/cases/trace13.txt -s $(TSH) -a $(TSHARGS)
test14: $(TSH)
	$(DRIVER) -t ./test/cases/trace14.txt -s $(TSH) -a $(TSHARGS)
test15: $(TSH)
	$(DRIVER) -t ./test/cases/trace15.txt -s $(TSH) -a $(TSHARGS)
test16: $(TSH)
	$(DRIVER) -t ./test/cases/trace16.txt -s $(TSH) -a $(TSHARGS)

# Run the tests using the reference shell program
rtest01:
	$(DRIVER) -t ./test/cases/trace01.txt -s $(TSHREF) -a $(TSHARGS)
rtest02:
	$(DRIVER) -t ./test/cases/trace02.txt -s $(TSHREF) -a $(TSHARGS)
rtest03:
	$(DRIVER) -t ./test/cases/trace03.txt -s $(TSHREF) -a $(TSHARGS)
rtest04:
	$(DRIVER) -t ./test/cases/trace04.txt -s $(TSHREF) -a $(TSHARGS)
rtest05:
	$(DRIVER) -t ./test/cases/trace05.txt -s $(TSHREF) -a $(TSHARGS)
rtest06:
	$(DRIVER) -t ./test/cases/trace06.txt -s $(TSHREF) -a $(TSHARGS)
rtest07:
	$(DRIVER) -t ./test/cases/trace07.txt -s $(TSHREF) -a $(TSHARGS)
rtest08:
	$(DRIVER) -t ./test/cases/trace08.txt -s $(TSHREF) -a $(TSHARGS)
rtest09:
	$(DRIVER) -t ./test/cases/trace09.txt -s $(TSHREF) -a $(TSHARGS)
rtest10:
	$(DRIVER) -t ./test/cases/trace10.txt -s $(TSHREF) -a $(TSHARGS)
rtest11:
	$(DRIVER) -t ./test/cases/trace11.txt -s $(TSHREF) -a $(TSHARGS)
rtest12:
	$(DRIVER) -t ./test/cases/trace12.txt -s $(TSHREF) -a $(TSHARGS)
rtest13:
	$(DRIVER) -t ./test/cases/trace13.txt -s $(TSHREF) -a $(TSHARGS)
rtest14:
	$(DRIVER) -t ./test/cases/trace14.txt -s $(TSHREF) -a $(TSHARGS)
rtest15:
	$(DRIVER) -t ./test/cases/trace15.txt -s $(TSHREF) -a $(TSHARGS)
rtest16:
	$(DRIVER) -t ./test/cases/trace16.txt -s $(TSHREF) -a $(TSHARGS)
