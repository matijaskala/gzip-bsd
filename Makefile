BINDIR=$(DESTDIR)/usr/bin
MANDIR=$(DESTDIR)/usr/share/man/man1

all: gzip

gzip: gzip.c
	$(CC) -o $@ $< $(shell pkg-config --cflags --libs libbsd-overlay liblzma zlib) -lbz2 -DNO_COMPRESS_SUPPORT -DNO_LZ_SUPPORT $(CFLAGS)

install: all
	install -d $(BINDIR)
	install gzip gzexe zdiff zforce zgrep zmore znew $(BINDIR)
	ln -sf gzip $(BINDIR)/gunzip
	ln -sf gzip $(BINDIR)/gzcat
	ln -sf gzip $(BINDIR)/zcat
	ln -sf zdiff $(BINDIR)/zcmp
	ln -sf zgrep $(BINDIR)/zegrep
	ln -sf zgrep $(BINDIR)/zfgrep
	ln -sf zmore $(BINDIR)/zless
	install -d $(MANDIR)
	install -m644 gzip.1 gzexe.1 zdiff.1 zforce.1 zgrep.1 zmore.1 znew.1 $(MANDIR)
	ln -sf gzip.1 $(MANDIR)/gunzip.1
	ln -sf gzip.1 $(MANDIR)/gzcat.1
	ln -sf gzip.1 $(MANDIR)/zcat.1
	ln -sf zdiff.1 $(MANDIR)/zcmp.1
	ln -sf zgrep.1 $(MANDIR)/zegrep.1
	ln -sf zgrep.1 $(MANDIR)/zfgrep.1
	ln -sf zmore.1 $(MANDIR)/zless.1
