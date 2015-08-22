name = dmesg_uptime
sourcefilename = $(name).c
PKGS = glib-2.0

all: $(name)

$(name): $(sourcefilename)
	@-/bin/false
	pkg-config --cflags --libs $(PKGS)
	$(CC) -g -o $@ $(sourcefilename) $(WARNINGS) $(shell pkg-config --cflags --libs $(PKGS))

clean:
	rm -f $(name)

