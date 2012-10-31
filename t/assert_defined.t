#!perl -Tw

use warnings;
use strict;

use Test::More tests => 5;

BEGIN { use_ok( 'Carp::Assert::More' ); }

local $@;
$@ = '';

# 3 is defined
eval {
    assert_defined( 3 );
};
is( $@, '' );

# 0 is defined (false, but defined)
eval {
    assert_defined( 0 );
};
is( $@, '' );

# '' is defined (false, but defined)
eval {
    assert_defined( 0 );
};
is( $@, '' );

eval {
    assert_defined( undef );
};
like( $@, qr/Assertion.*failed/ );
