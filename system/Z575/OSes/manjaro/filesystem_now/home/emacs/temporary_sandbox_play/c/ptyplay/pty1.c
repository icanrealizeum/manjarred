//this code is from: http://linux.die.net/man/3/fd_isset
//likely modified at this point
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

#include <errno.h>


#define PTY_BUFFER_SIZE 128
static char buf[PTY_BUFFER_SIZE] = "\0";

//this function is from mc-git 's subshell.c file
/**
 *  Write all data, even if the write() call is interrupted.
 */

  static ssize_t
write_all (int fd, const void *buf, size_t count)
{
  ssize_t written = 0;

  //    fprintf(stderr,"write_all(%d)\n\r",count);
  //    fflush(stderr);
  if (count == 11) {
    //      fprintf(stderr,"%s",NULL); //#emacs
  }
  while (count > 0)
  {
    ssize_t ret;

    ret = write (fd, (const unsigned char *) buf + written, count);
    //        fprintf(stderr,"written %d/%d/%d\n",ret,written,count);
    //        fflush(stderr);
    if (ret < 0)
    {
      if (errno == EINTR)
      {
        continue;
      }

      return written > 0 ? written : ret;
    }
    count -= ret;
    written += ret;
  }
  return written;
}


  int
main(void)
{
  fd_set rfds;
  struct timeval tv;
  int retval;
  int fd=2;
  int bytes;

  int wcnt=0;
  while (++wcnt) {
    /* Watch stdin (fd 0) to see when it has input. */
    FD_ZERO(&rfds);
    FD_SET(fd, &rfds);

    /* Wait up to five seconds. */
    tv.tv_sec = 5;
    tv.tv_usec = 0;

    retval = select(fd+1, &rfds, NULL, NULL, &tv);
    /* Don't rely on the value of tv now! */

    if (retval == -1)
      perror("select()");
    else if (FD_ISSET(fd, &rfds)) {
      printf("Data is available now. retval was %d wcnt=%d\n", retval,wcnt);
      bytes = read(fd, buf, sizeof(buf));
      printf("read %d bytes\n", bytes);
      if (bytes>0) { //ie. ctrl+d will cause 0
        write_all(fd, buf, bytes);
      }
    }
    else if (0==retval) {
      printf("No data within five seconds, retval=%d\n",retval);
      break;
    }else {
      printf("impossible!\n");
      break;
    }
  }//while
  exit(EXIT_SUCCESS);
}

