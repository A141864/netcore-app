#!/bin/bash

function build {
    dotnet restore
    dotnet build aspnetapp.csproj
}

function unit {
    dotnet test aspnetapp.csproj   
}

function bundle {
    dotnet pack --output nupkgs aspnetapp.csproj
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