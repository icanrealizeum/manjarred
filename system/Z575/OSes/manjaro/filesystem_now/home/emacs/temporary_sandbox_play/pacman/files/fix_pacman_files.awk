#!/bin/awk -f

#this fixes a `files` file from pacman which was broken by pacman-db-update
#see this: https://lists.archlinux.org/pipermail/pacman-dev/2014-October/019422.html
#I don't recommend that --dbonly fix, though it is likely 99% ok, 1% it just forgets the checksum for the backup files

BEGIN {
  files_="";
  backup="";
}

{
  if ( NF > 2 ) {
    # unexpected more than 2 fields
    exit 19;
  }
#  print $1
  if ( NF == 2 ) {
    if ( $2 == "" ) {
      # like impossible?
      exit 14;
    } else {
      # 2 fields with second field non-empty
      backup=backup $1 "\t" $2 "\n"
    }
  } else {
    # NF = 0 or 1
    if ( NF == 0 ) {
      # unexpected 0 fields, empty line ?
      exit 11;
    } else {
      # NF = 1 
      # %FILES%
      switch ($1) {
        case "" : 
          exit 13; #impossible due to how awk works, it seems.
          break; #heh
        case "%FILES%": 
        case "%BACKUP%":
          next;
          break; #heh
        case "%.*": 
          exit 99; #broken contents?
          break; #riight?
        default:
          files_=files_ $1 "\n"
          break;
      }
#      if ( $1 == "" ) { 
#        #this isn't triggered looks like
#        #so, impossible?
#        exit 13
#      } else {
#        # non empty
#        files_=files_ $1 "\n"
#      }
    }
  }
}

END {
  print "%FILES%"
  print files_
#  print ""
  print "%BACKUP%"
  print backup
#  for (each in files_) {
#    print each
#  }
}

