#!/usr/bin/perl

use warnings;
use strict;

use Test::More tests => 11;

use Carp::Assert::More;

local $@;
$@ = '';

# one element in arrayref
eval {
    assert_in('one', [ 'one' ] );
};
is( $@, '' );

# separate string, two elements
eval {
    my $string = 'B';
    assert_in( $string, [ 'A', 'B' ]  );
};
is( $@, '' );

# separate string and manual arrayref
eval {
    my $string = 'delta';
    my @array = ('alpha','beta','delta');
    assert_in( $string, \@array );
};
is( $@, '' );

# separate string and arrayref
eval {
    my $string = 'tres';
    my $ref = [ 'uno', 'dos', 'tres', 'quatro' ];
    assert_in( $string, $ref  );
};
is( $@, '' );

# not found fails
eval {
    assert_in( 'F', [ 'A', 'B', 'C', 'D', 'E' ] );
};
like( $@, qr/Assertion.*failed/ );

# undefs in the list fails
eval {
    assert_in( 'C', [ 'A', 'B', 'C', undef ] );
};
like( $@, qr/Assertion.*failed/ );

# refs in the list fails
eval {
    assert_in( 'C', [ 'A', 'B', 'C', {} ] );
};
like( $@, qr/Assertion.*failed/ );

# undef string fails
eval {
    assert_in( undef, [ 'fail' ] );
};
like( $@, qr/Assertion.*failed/ );

# empty array fails
eval {
    assert_in( 'empty', [ ] );
};
like( $@, qr/Assertion.*failed/ );

# undef for the arrayref fails
eval {
    my $string = 'zippo';
    assert_in( $string, undef );
};
like( $@, qr/Assertion.*failed/ );

# A bad reference should also fail.
eval {
    my $string = 'nil';
    my $ref = \$string;
    assert_in( $string, $ref );
};
like( $@, qr/Assertion.*failed/ );
