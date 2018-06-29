#!/bin/bash
/usr/bin/rsync "$@"
result=$?

(
  if [ $result -eq 0 ]; then
     notify-send -u critical -t 60 -i info 'Synced succefully' "The Folder:\n '$9'  was synced";

  fi
) >/dev/null 2>/dev/null </dev/null

exit $result
