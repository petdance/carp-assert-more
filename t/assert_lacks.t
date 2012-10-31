#!perl -Tw

use warnings;
use strict;

use Test::More tests=>7;

BEGIN {
    use_ok( 'Carp::Assert::More' );
}

my %foo = (
    name => "Andy Lester",
    phone => "578-3338",
    wango => undef,
);


eval {
    assert_lacks( \%foo, 'Name' );
};
is( $@, "" );


eval {
    assert_lacks( \%foo, 'name' );
};
like( $@, qr/Assert.+failed/ );


eval {
    assert_lacks( \%foo, [qw( Wango )] );
};
is( $@, "" );

eval {
    assert_lacks( \%foo, [qw( Wango Tango )] );
};
is( $@, "" );

eval {
    assert_lacks( \%foo, [qw( Wango Tango name )] );
};
like( $@, qr/Assertion.+failed/ );

eval {
    assert_lacks( \%foo, [qw()] );
};
is( $@, "" );

