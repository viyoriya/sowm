CFLAGS += -std=c99 -Wall -Wextra -pedantic -Wold-style-declaration
CFLAGS += -Wmissing-prototypes -Wno-unused-parameter -Wno-missing-field-initializers
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
CC     ?= gcc

all: config.h sowm

config.h:
	cp config.def.h config.h

sowm:
	$(CC) -O3 $(CFLAGS) -o sowm sowm.c -lX11 $(LDFLAGS)

install: all
	install -Dm755 sowm $(DESTDIR)$(BINDIR)/sowm

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/sowm

clean:
	rm -f sowm *.o

.PHONY: all install uninstall clean
