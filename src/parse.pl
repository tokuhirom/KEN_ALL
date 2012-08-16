#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use autodie;

use Parse::JapanesePostalCode;
binmode(STDOUT, ":utf8");

my $parser = Parse::JapanesePostalCode->new( file => 'KEN_ALL.CSV' );
while (my $obj = $parser->fetch_obj) {
    my @list = map { $_ ? $_ : () } ($obj->zip, $obj->pref, $obj->district, $obj->city, $obj->ward, $obj->town);
    if ($obj->has_subtown) {
        push @list, join '/', @{ $obj->subtown };
    }
    if ($obj->build) {
        my $str = $obj->build;
        $str .= $obj->floor . 'F' if $obj->floor;
        push @list, $str;
    }
    print "@list\n";
}

