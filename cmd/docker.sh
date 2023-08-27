#!/bin/bash

build()
{
    docker build . -f docker/Dockerfile -t node-vsc-ext
}

shell()
{
    docker run -it --rm --user node:node -v "$(pwd):/app" -w /app node:19-alpine3.15 /bin/sh
}


shell_root()
{
    docker run -it --rm -v "$(pwd):/app" -w /app node:19-alpine3.15 /bin/sh
}

if [[ $1 == "build" ]]; then
    build
elif [[ $1 == "shell" ]]; then
    shell 
elif [[ $1 == "shell_root" ]]; then
    shell_root
fi