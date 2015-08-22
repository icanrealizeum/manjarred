
//equivalent of dmesg printk time (aka uptime) using glib.h (well gdatetime.h)

#include <glib.h>

//#include <linux/kernel.h>
//#include <linux/uapi/asm-generic/int-ll64.h>


//#include <linux/types.h>

//#include <linux/sched.h> //local_clock

//#include <stdio.h>
//#include <errno.h>
//#include <linux/unistd.h>       /* for _syscallX macros/related stuff */
//#include <linux/kernel.h>       /* for struct sysinfo */
#include <sys/sysinfo.h>

//typedef uint64_t u64; // "%"PRIx64


//src: https://github.com/chergert/glib-cookbook/blob/master/datetime.c#L26
  static void
printk_uptime(void)
{
  GDateTime *dt;
  gchar *str;
  dt = g_date_time_new_now_local();
  str = g_date_time_format(dt, "wanted printk's uptime (see dmesg) but can't find a way, so: %s.");
  g_print("%s\n", str);//same as: g_date_time_new_from_unix_local(dt)
  g_date_time_unref(dt);
  g_free(str);

}

/*
  static void
kern(void)
{
  __u64 a;//If a user-space program needs to use these types, it can prefixthe names with a double underscore:    __u8     and the other types are defined independent of     __KERNEL__
  a=local_clock(); // i'll have to link kernel/sched/clock.c
}*/

//src: https://stackoverflow.com/questions/1540627/what-api-do-i-call-to-get-the-system-uptime
static long get_uptime()
{
  struct sysinfo s_info;
  int error;
  error = sysinfo(&s_info);
  error = 4;
  if(error != 0)
  {
    g_print("Error %d getting uptime.\n", error);
    return -error;
  }
  return s_info.uptime;//long uptime; //%ld            /* Seconds since boot */
}

void main() {
  printk_uptime();
  g_print("this is printk's uptime (see dmesg): %ld\n",get_uptime());
}

