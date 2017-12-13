#!/bin/bash

function build {
    docker run -i -v $(pwd):/app microsoft/aspnetcore-build:2.0 \
        ls /app;dotnet build /app/aspnetapp.csproj
}

function unit {
 docker run -i -v $(pwd):/app microsoft/aspnetcore-build:2.0 \
    dotnet test /app/aspnetapp.csproj   
}

function bundle {
 docker run -i -v $(pwd):/app microsoft/aspnetcore-build:2.0 \
    dotnet pack --output /app/nupkgs /app/aspnetapp.csproj
}

function deploy {
    echo "Deploy not yet implemented..."
    exit 1
}

while test $# -gt 0
do
    case "$1" in
        --build) build
        ;;
        --test) unit
        ;;
        --bundle) bundle
        ;;
        --deploy) deploy
        ;;
    esac
    shift
done