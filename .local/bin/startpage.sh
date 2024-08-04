#!/bin/sh

main () {
  cd "/home/kvl/.config/myStartpage"
  python -m http.server
}
main
