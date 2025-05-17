#!/usr/bin/env bash

set -ex

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm ansible
