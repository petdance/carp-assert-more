#!/usr/bin/perl

use warnings;
use strict;

use Test::More tests => 8;

BEGIN { use_ok( 'Carp::Assert::More' ); }

local $@;
$@ = '';

# 'like' is in 'unlikely'
eval {
    assert_like('unlikely', qr/like/ );
};
is( $@, '' );

# 'te.*st' matches 'tempest'
eval {
    my $string = 'tempest';
    assert_like( $string, qr/te.*st/  );
};
is( $@, '' );

# 'qu.*inn' matches 'quality inn'
eval {
    my $string = 'quality inn';
    my $regex = qr/qu.*inn/;
    assert_like( $string, $regex );
};
is( $@, '' );

# 'fa.*il' does not match 'passing'
eval {
    assert_like( 'passing', qr/fa.*il/ );
};
like( $@, qr/Assertion.*failed/ );

# undef with a regex will fail
eval {
    assert_like( undef, qr/fails/ );
};
like( $@, qr/Assertion.*failed/ );

# A string without a regex fails, too
eval {
    my $string = "Blah blah";
    assert_like( $string, undef );
};
like( $@, qr/Assertion.*failed/ );

# A bad reference should also fail.
eval {
    my $string = "Blah blah";
    my $ref = \$string;
    assert_like( $string, $ref );
};
like( $@, qr/Assertion.*failed/ );
