#!/bin/bash

curl -X POST --data-binary @./qemu-os.yaml https://factory.talos.dev/schematics

curl -X POST --data-binary @./rpi-os.yaml https://factory.talos.dev/schematics
