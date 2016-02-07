#!/bin/sh

pushd $(dirname "${0}") > /dev/null
BASE_DIR=$(pwd -L)
popd > /dev/null

cd "${BASE_DIR}"

ruby private_contributions.rb