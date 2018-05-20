BUILDDIR=.build/debug
BIN=$(BUILDDIR)/Tests
MOD=TAP
MODSRC=Sources/TAP/tap.swift
MODULE=$(BUILDDIR)/$(MOD).swiftmodule $(BUILDDIR)/$(MOD).swiftdoc
SWIFTC=swiftc
SWIFT=swift
ifdef SWIFTPATH
	SWIFTC=$(SWIFTPATH)/swiftc
	SWIFT=$(SWIFTPATH)/swift
endif

all: $(BIN)

$(BIN):
	$(SWIFT) build
clean:
	-rm -r .build
test: $(BIN)
	prove ./$(BIN)
repl: $(MODULE)
	$(SWIFT) -I$(BUILDDIR) -L$(BUILDDIR) -l$(BUILDDIR)/$(MOD)
