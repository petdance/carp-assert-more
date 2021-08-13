#!/usr/bin/perl

use warnings;
use strict;
use 5.010;

use blib;

use Carp::Assert::More;

say version => $Carp::Assert::More::VERSION;

use Benchmark;

my @stooges = qw( Larry Curly Moe Shemp Joe );
my %stooges = map { $_ => 1 } @stooges;


my @states = qw(
    AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO
    MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY
);
my %states = map { $_ => 1 } @states;

timethis( 100_000,
    sub {
        #assert_in( 'Shemp', \@stooges );
        #assert_keys_are( \%stooges, \@stooges );
        #    my $x = foo();
        #assert_positive_integer( 2112 );
        assert_in( 'TX', \@states );
    }
);
