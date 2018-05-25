BUILDDIR=.build/debug
BIN=$(BUILDDIR)/Tests
RESULTS=$(BUILDDIR)/Results.txt
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
$(RESULTS): $(BIN)
	$(SWIFT) test | grep -v "^(Compile|Linking)" | cat > $(RESULTS)
test: $(RESULTS)
	prove --exec "cat" $(RESULTS)
repl: $(MODULE)
	$(SWIFT) -I$(BUILDDIR) -L$(BUILDDIR) -l$(BUILDDIR)/$(MOD)
