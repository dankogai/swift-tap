BUILDDIR=.build/debug
OBJECT=$(BUILDDIR)/TAP.build/tap.swift.o
RESULTS=$(BUILDDIR)/Results.txt
MOD=TAP
MODSRC=Sources/TAP/tap.swift
MODULE=$(BUILDDIR)/$(MOD).swiftmodule $(BUILDDIR)/$(MOD).swiftdoc
TESTSSRC=Sources/Tests/TAPTests/TAPTests.swift
SWIFTC=swiftc
SWIFT=swift
ifdef SWIFTPATH
	SWIFTC=$(SWIFTPATH)/swiftc
	SWIFT=$(SWIFTPATH)/swift
endif

all: $(OBJECT)

$(OBJECT): $(MODSRC)
	$(SWIFT) build
clean:
	-rm -r .build
$(RESULTS): $(OBJECT) $(TESTSSRC)
	$(SWIFT) test | grep -v "^(Compile|Linking)" | cat > $(RESULTS) && echo
test: $(RESULTS)
	prove --exec "cat" $(RESULTS)
repl: $(MODULE)
	$(SWIFT) -I$(BUILDDIR) -L$(BUILDDIR) -l$(BUILDDIR)/$(MOD)
