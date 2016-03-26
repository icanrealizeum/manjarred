#!/bin/bash

onint() {
  echo "triggered"
}

#trap sigs:
  #trap onint sighup sigint sigabrt sigquit sigkill
  trap 'echo "triggered"; echo "ok"' sighup sigint sigabrt sigquit sigkill
  #sighup sigkill are not triggering!
  #sigabrt sigquit trigger only after C-c aka sigint!
  #sigint is the only one triggering!

#reset sigs:
  #trap - sighup sigint sigabrt sigquit sigkill

echo "kill -3 $$"
sleep 15


