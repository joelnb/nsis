#!/bin/sh

flex -fvi8 nsis_parser.flex
gcc -o nsis_parser flex.yy.c