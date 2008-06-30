#!/bin/sh

mkdir -p bin
cc -o bin/loginwindow_refresh loginwindow_refresh.c -framework CoreFoundation
