#!perl -Tw

package Foo;

sub new { my $class = shift; return bless [@_], $class; }

package main;

use warnings;
use strict;

use Test::More tests => 7;

use Carp::Assert::More;

local $@;
$@ = '';

# {} is not an arrayref.
eval {
    assert_arrayref( {} );
};
like( $@, qr/Assertion.*failed/ );

# A ref to a hash with stuff in it is not an arrayref.
my $ref = { foo => 'foo', bar => 'bar' };
eval {
    assert_arrayref( $ref );
};
like( $@, qr/Assertion.*failed/ );

# 3 is not an arrayref.
eval {
    assert_arrayref( 3 );
};
like( $@, qr/Assertion.*failed/ );

# [] is an arrayref.
eval {
    assert_arrayref( [] );
};
is( $@, '' );

# A ref to a list with stuff in it is an arrayref.
my @ary = ('foo', 'bar', 'baaz');
eval {
    assert_arrayref( \@ary );
};
is( $@, '' );

# Sub {} is not an arrayref.
eval {
    assert_arrayref( sub {} );
};
like( $@, qr/Assertion.*failed/ );

# Foo->new->isa("ARRAY") returns true, so do we
eval {
    assert_arrayref( Foo->new );
};
is( $@, '' );

done_testing();
exit 0;
