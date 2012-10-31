#!perl -Tw

use warnings;
use strict;

use Test::More tests => 8;

BEGIN {
    use_ok( 'Carp::Assert::More' );
}

use constant PASS => 1;
use constant FAIL => 0;

my $array_object = bless( [], 'WackyPackage' );

my @cases = (
    [ 0         => FAIL ],
    [ 'foo'     => FAIL ],
    [ undef     => FAIL ],
    [ {}        => FAIL ],
    [ []        => FAIL ],
    [ {foo=>1}  => PASS ],
    [ [1,2,3]   => PASS ],
);

for my $case ( @cases ) {
    my ($val,$expected_status) = @$case;

    eval { assert_nonempty( $val ) };
    $val = "undef" if !defined($val);
    my $desc = "Checking \"$val\"";

    if ( $expected_status eq FAIL ) {
        like( $@, qr/Assertion.+failed/, $desc );
    } else {
        is( $@, "", $desc );
    }
}

