
# http://mrbook.org/tutorials/make/
CC=gcc
CFLAGS=-Wall
LDFLAGS=
SOURCES=pty1.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=pty1

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@


