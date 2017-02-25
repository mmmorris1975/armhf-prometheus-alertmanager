#!/bin/bash -x

ver=${VERSION:="0.5.1"}
exp_name=alertmanager

NAME=$(basename $(dirname $PWD/Dockerfile))
URL="https://github.com/prometheus/${exp_name}/releases/download/v${ver}/${exp_name}-${ver}.linux-armv7.tar.gz"

wget -N $URL
tar xzf ${exp_name}-${ver}.linux-armv7.tar.gz --strip-components 1 --wildcards "*/alertmanager*" "*/simple.yml"

docker build -t ${NAME}:${ver} -t ${NAME}:latest .

rm alertmanager simple.yml
