# Makefile by Scott Leland Crossen
# @Copyright 2017 Scott Leland Crossen

# ==== Definitions ====

BYUNETID = slxn42
VERSION = 1
HANDINDIR = /users/faculty/snell/CS324/handin/Fall2017/Shell
TMPDIR = tmp
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
	scp ${SOURCEDIR}/tsh.c ${BYUNETID}@schizo.cs.byu.edu:${HANDINDIR}/${BYUNETID}-${VERSION}-tsh.c

.PHONY: clean
clean:
	rm -rf $(TMPDIR) $(RELDIR)

# ==== Targets ====

.PRECIOUS: ${TMPDIR}/%.o
${TMPDIR}/%.o: ${SOURCEDIR}/%.c
	mkdir -p $(@D)
	$(COMP) -c $< -o $@ $(COMPFLAGS)

.PRECIOUS: ${RELDIR}/%
${RELDIR}/%: ${TMPDIR}/%.o
	mkdir -p $(@D)
	$(COMP) $^ -o $@ $(LINKFLAGS)

# ==== Regression Tests ====

# Run tests using the custom shell program
test%: $(TSH)
	$(DRIVER) -t ./test/cases/trace$*.txt -s $(TSH) -a $(TSHARGS)

# Run the tests using the reference shell program
rtest%:
	$(DRIVER) -t ./test/cases/trace$*.txt -s $(TSHREF) -a $(TSHARGS)
