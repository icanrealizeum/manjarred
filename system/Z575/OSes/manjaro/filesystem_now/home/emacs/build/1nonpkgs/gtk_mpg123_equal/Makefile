CC = gcc -g



all: clean gtk_mpg123_equal


clean:
	rm -rf *~ *.bak gtk_mpg123_equal





gtk_mpg123_equal:
	$(CC)  gtk_mpg123_equal.c -o gtk_mpg123_equal `pkg-config gtk+-2.0 --cflags`  `pkg-config gtk+-2.0 --libs` 


tar: clean
	cd ..;tar cvfz /tmp/gtk_mpg123_equal.tgz gtk_mpg123_equal/
