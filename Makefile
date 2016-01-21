ifdef SWIFTPATH
	SWIFTC=$(SWIFTPATH)/swiftc
	SWIFT=$(SWIFTPATH)/swift
else
	SWIFTC=xcrun -sdk macosx swiftc
	SWIFT=swift
endif

MAIN=main
MODSRC=tap/tap.swift
SRC=$(MODSRC) tap/main.swift
MODNAME=TAP
MODULE=$(MODNAME).swiftmodule $(MODNAME).swiftdoc 
SHLIB=lib$(MODNAME)

all: $(MAIN)
module: $(MODULE)
clean:
	-rm $(MAIN) $(MODULE) $(MODULE) $(SHLIB).*
$(MAIN): $(SRC)
	$(SWIFTC) $(SRC)
test: $(MAIN)
	prove ./main
$(MODULE): $(MODSRC)
	$(SWIFTC) -emit-library -emit-module $(MODSRC) -module-name $(MODNAME)
repl: $(MODULE)
	$(SWIFT) -I. -L. -l$(MODNAME)
