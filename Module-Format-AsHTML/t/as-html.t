#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 2;

use Module::Format::AsHTML ();

{
    my $cpan = Module::Format::AsHTML->new();

    # TEST
    ok( $cpan, "object was instantiated" );

    # TEST
    is( $cpan->homepage( { who => "shlomif" } ),
        "https://metacpan.org/author/SHLOMIF", "homepage" );
}
