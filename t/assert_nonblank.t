#!perl -Tw

use warnings;
use strict;

use Test::More tests => 6;

BEGIN { use_ok( 'Carp::Assert::More' ); }

local $@;
$@ = '';

# 3 is nonblank
eval {
    assert_nonblank( 3 );
};
is( $@, '' );

# 0 is nonblank 
eval {
    assert_nonblank( 0 );
};
is( $@, '' );

# '' is blank
eval {
    assert_nonblank( '' );
};
like( $@, qr/Assertion.*failed/ );

# undef is not nonblank
eval {
    assert_nonblank( undef );
};
like( $@, qr/Assertion.*failed/ );

# References are not nonblank
eval {
    my $scalar = "Blah blah";
    my $ref = \$scalar;
    assert_nonblank( $ref );
};
like( $@, qr/Assertion.*failed/ );
