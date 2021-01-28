# please install gcc-ada

SOURCES=src/main.adb
BIN=mines

.PHONY: all soft-clean clean check

all:
	gnatmake $(SOURCES) -o $(BIN)
	$(MAKE) --no-print-directory soft-clean

soft-clean:
	$(RM) *.o
	$(RM) *.ali

clean: soft-clean
	$(RM) $(BIN)

check: clean all
	./$(BIN)
