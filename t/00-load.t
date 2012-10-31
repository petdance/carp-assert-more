#!perl -Tw

use Test::More tests => 1;

BEGIN {
    use_ok( 'Carp::Assert::More' );
}

diag( "Testing Carp::Assert::More $Carp::Assert::More::VERSION under Perl $] and Test::More $Test::More::VERSION" );
