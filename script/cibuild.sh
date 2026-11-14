#! /bin/bash

set -e

yarn build
yarn build:tailwind

sh script/check-build.sh
