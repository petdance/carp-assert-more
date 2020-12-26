#!perl -Tw

use warnings;
use strict;

use Test::More tests => 7;

use Carp::Assert::More;

use constant PASS => 1;
use constant FAIL => 2;

my @cases = (
    [ 5,        PASS ],
    [ 0,        FAIL ],
    [ 0.4,      FAIL ],
    [ -10,      FAIL ],
    [ 'dog',    FAIL ],
    [ '14.',    FAIL ],
    [ '14',     PASS ],
);

for my $case ( @cases ) {
    my ($val,$status) = @$case;

    my $desc = "Checking \"$val\"";
    eval { assert_positive_integer( $val ) };

    if ( $status eq FAIL ) {
        like( $@, qr/Assertion.+failed/, $desc );
    } else {
        is( $@, '', $desc );
    }
}

done_testing();
exit 0;
