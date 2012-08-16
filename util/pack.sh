#!/bin/sh
SRC=src/parse.pl
fatpack trace $SRC
fatpack packlists-for `cat fatpacker.trace` > fatpacker.packlists
fatpack tree `cat fatpacker.packlists`

[ -d lib ] || mkdir lib

echo "#!/usr/bin/env perl" >> ken_all.pl
echo >> ken_all.pl
fatpack file >> ken_all.pl
cat $SRC >> ken_all.pl

