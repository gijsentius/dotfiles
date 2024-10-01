#!/bin/sh

echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEOUv0jBVMEYD0/GG9LyKtFdieW6Qde4eumF+SixB92M g.m.entius@gmail.com' > ~/.ssh/id_ed25519.pub
PRIVATE_KEY=$(bw get item c4e8d248-e7ba-4e62-8bfd-d4dc007b28ff 2>/dev/null | jq '.notes' | sed s/\"//g)
echo $PRIVATE_KEY > ~/.ssh/id_ed25519
unset PRIVATE_KEY
