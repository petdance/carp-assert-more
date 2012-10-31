#!perl -Tw

use warnings;
use strict;

use Test::More tests => 5;
use IO::File; # just for creating objects

BEGIN { use_ok( 'Carp::Assert::More' ); }

local $@;
$@ = '';

eval {
    my $fh = new IO::File;
    assert_isa( $fh, 'IO::File', 'Created an IO::File object' );
    assert_isa( $fh, 'GLOB',     'Created an IO::File object, which is a GLOB' );
};
is( $@, '' );

eval {
    my $random = 2112;
    assert_isa( $random, 'IO::File', 'Created an IO::File object' );
};
like( $@, qr/Assertion.*failed/ );



eval {
    my @array;
    assert_isa( \@array, 'HASH', 'An array is not a hash' );
};
like( $@, qr/Assertion.*failed/ );

eval {
    my %hash;
    assert_isa( \%hash, 'HASH', 'Created a hash' );
};
is( $@, '' );
