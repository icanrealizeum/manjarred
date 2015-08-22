#include <errno.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/un.h>


// get sockaddr, IPv4 or IPv6:
void *get_in_addr(struct sockaddr const* sa)
{
    if (sa->sa_family == AF_INET) {
        return &(((struct sockaddr_in*)sa)->sin_addr);
    }else if (sa->sa_family == AF_INET6) {
      return &(((struct sockaddr_in6*)sa)->sin6_addr);
    }else if (sa->sa_family == AF_LOCAL) {
//      printf("!! unexpected family type AF_LOCAL\n");
      return &(((struct sockaddr_un*)sa)->sun_path);
    }else {
      printf("!! unexpected family type %d\n",sa->sa_family);
      return NULL;
    }
//src: https://stackoverflow.com/questions/1824279/how-to-get-ip-address-from-sockaddr
}


int connect(int sockfd, struct sockaddr const* addr, socklen_t addrlen) {
  char s[INET6_ADDRSTRLEN];
  char *p=NULL;
  if (addr->sa_family == AF_LOCAL) {
    p=get_in_addr(addr);
    printf("!! Connection refused to: %s\n",p);
    return -1;
/*    printf("!! Connection allowed to: %s\n",p);//TODO: allow for LOCAL! or else firefox won't start due to  Error: cannot open display: :0.0  This seems to need to recompile glib and maybe add a new alias for the same function, see: sysdeps/unix/sysv/linux/connect.c (of git clone git://sourceware.org/git/glibc.git ) and possibly (in kernel-git) net/socket.c 1533
    return originalconnect(sockfd,addr,addrlen);*/
  }else{
    inet_ntop(addr->sa_family, get_in_addr(addr), s, sizeof s);
    p=s;
    errno = ECONNREFUSED;
    printf("!! Connection refused to: %s\n",p);
    return -1;
  }
//src: https://superuser.com/questions/179994/is-there-an-interactive-firewall-for-outbound-traffic-on-ubuntu
}

