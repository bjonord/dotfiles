#! /bin/bash
# Lists all packages by size descending in case we want to see the bigger packages.
function apt-list-packages {
  dpkg-query -W --showformat='${Installed-Size} ${Package} ${Status}\n' | grep -v deinstall | sort -n | awk '{print $1" "$2}'
}