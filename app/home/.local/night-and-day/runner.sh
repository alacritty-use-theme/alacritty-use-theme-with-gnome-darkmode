#!/bin/bash

function runner() {
  echo $@
  local default_lat=42.4509
  local default_lng=-83.6618
  lat=${1:-$default_lat};
  lng=${2:-$default_lng};

  echo "FINDME $lat $lng"

  . ./.local/night-and-day/src/get-mode.sh ${lat} ${lng}
}

runner $@
