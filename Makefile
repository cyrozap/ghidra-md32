# Makefile mostly borrowed from https://github.com/yath/ghidra-xtensa

# Assume we are in Ghidra/Processors/subdir
GHIDRA_DIR ?= $(shell readlink -f $(CURDIR)/../../..)
SLEIGH ?= $(GHIDRA_DIR)/support/sleigh

# -x  turns on parser debugging (SleighCompile)
# -u  print warnings for unnecessary pcode instructions (SleighCompile)
# -l  report pattern conflicts (SleighCompile)
# -n  print warnings for all NOP constructors (SleighCompile)
# -t  print warnings for dead temporaries (SleighCompile)
# -e  enforce use of 'local' keyword for temporaries (SleighCompile)
# -f  print warnings for unused token fields (SleighCompile)
SLEIGH_ARGS := -x -u -l -n -t -e -f

LANGDIR := data/languages

SLA_SRCS := $(LANGDIR)/md32.slaspec $(wildcard $(LANGDIR)/*.sinc)
SLA := $(LANGDIR)/md32.sla


all: check-ghidra $(SLA)

check-ghidra:
	@if [ ! -d $(GHIDRA_DIR)/Ghidra ]; then \
		echo "Your Ghidra installation directory could not be determined." >&2; \
		echo "Please re-run make with GHIDRA_DIR set to the root of your Ghidra installation." >&2; \
		exit 1; \
	fi

$(SLA): $(SLA_SRCS)
	$(SLEIGH) $(SLEIGH_ARGS) $< $@

clean:
	rm -rf $(SLA)

.PHONY: all check-ghidra
