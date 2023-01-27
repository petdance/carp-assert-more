#!perl -Tw

use warnings;
use strict;

use Test::More tests => 113;

use Test::Exception;

use Carp::Assert::More;


my $failed = qr/Assertion failed/;


NUMERIC_EQ: {
    lives_ok( sub { assert_cmp( 1, '==', 1 ) }, 'num == num' );
    lives_ok( sub { assert_cmp( 2, '==', '2' ) }, 'num == str' );
    lives_ok( sub { assert_cmp( '3', '==', 3 ) }, 'str == num' );
    lives_ok( sub { assert_cmp( '4', '==', '4' ) }, 'str == str' );
    lives_ok( sub { assert_cmp( 5, '==', 5.0 ) }, 'int == float' );

    throws_ok( sub { assert_cmp( -1, '==', 1 ) }, $failed, 'num == num' );
    throws_ok( sub { assert_cmp( -2, '==', '2' ) }, $failed, 'num == str' );
    throws_ok( sub { assert_cmp( '-3', '==', 3 ) }, $failed, 'str == num' );
    throws_ok( sub { assert_cmp( '-4', '==', '4' ) }, $failed, 'str == str' );
    throws_ok( sub { assert_cmp( -5, '==', 5.0 ) }, $failed, 'int == float' );
}


NUMERIC_NE: {
    lives_ok( sub { assert_cmp( -1, '!=', 1 ) }, 'num != num' );
    lives_ok( sub { assert_cmp( -2, '!=', '2' ) }, 'num != str' );
    lives_ok( sub { assert_cmp( '-3', '!=', 3 ) }, 'str != num' );
    lives_ok( sub { assert_cmp( '-4', '!=', '4' ) }, 'str != str' );
    lives_ok( sub { assert_cmp( -5, '!=', 5.0 ) }, 'int != float' );

    throws_ok( sub { assert_cmp( 1, '!=', 1 ) }, $failed, 'num != num' );
    throws_ok( sub { assert_cmp( 2, '!=', '2' ) }, $failed, 'num != str' );
    throws_ok( sub { assert_cmp( '3', '!=', 3 ) }, $failed, 'str != num' );
    throws_ok( sub { assert_cmp( '4', '!=', '4' ) }, $failed, 'str != str' );
    throws_ok( sub { assert_cmp( 5, '!=', 5.0 ) }, $failed, 'int != float' );
}


NUMERIC_LT: {
    lives_ok( sub { assert_cmp( 1, '<', 2 ) }, 'num < num' );
    lives_ok( sub { assert_cmp( 2, '<', '3' ) }, 'num < str' );
    lives_ok( sub { assert_cmp( '3', '<', 4 ) }, 'str < num' );
    lives_ok( sub { assert_cmp( '4', '<', '5' ) }, 'str < str' );
    lives_ok( sub { assert_cmp( 5, '<', 6.0 ) }, 'int < float' );
    lives_ok( sub { assert_cmp( 6.0, '<', 7 ) }, 'float < int' );
    lives_ok( sub { assert_cmp( 7.0, '<', 8.0 ) }, 'float < float' );

    throws_ok( sub { assert_cmp( 1, '<', 1 ) }, $failed, 'num < num' );
    throws_ok( sub { assert_cmp( 2, '<', '2' ) }, $failed, 'num < str' );
    throws_ok( sub { assert_cmp( '3', '<', 3 ) }, $failed, 'str < num' );
    throws_ok( sub { assert_cmp( '4', '<', '4' ) }, $failed, 'str < str' );
    throws_ok( sub { assert_cmp( 5, '<', 5.0 ) }, $failed, 'int < float' );
    throws_ok( sub { assert_cmp( 6.0, '<', 6 ) }, $failed, 'float < int' );
    throws_ok( sub { assert_cmp( 7.0, '<', 7.0 ) }, $failed, 'float < float' );
}


NUMERIC_LE: {
    lives_ok( sub { assert_cmp( 1, '<=', 2 ) }, 'num <= num' );
    lives_ok( sub { assert_cmp( 2, '<=', '3' ) }, 'num <= str' );
    lives_ok( sub { assert_cmp( '3', '<=', 4 ) }, 'str <= num' );
    lives_ok( sub { assert_cmp( '4', '<=', '5' ) }, 'str <= str' );
    lives_ok( sub { assert_cmp( 5, '<=', 6.0 ) }, 'int <= float' );
    lives_ok( sub { assert_cmp( 6.0, '<=', 7 ) }, 'float <= int' );
    lives_ok( sub { assert_cmp( 7.0, '<=', 8.0 ) }, 'float <= float' );

    throws_ok( sub { assert_cmp( 1, '<=', 0 ) }, $failed, 'num <= num' );
    throws_ok( sub { assert_cmp( 2, '<=', '1' ) }, $failed, 'num <= str' );
    throws_ok( sub { assert_cmp( '3', '<=', 2 ) }, $failed, 'str <= num' );
    throws_ok( sub { assert_cmp( '4', '<=', '3' ) }, $failed, 'str <= str' );
    throws_ok( sub { assert_cmp( 5, '<=', 4.0 ) }, $failed, 'int <= float' );
    throws_ok( sub { assert_cmp( 6.0, '<=', 5 ) }, $failed, 'float <= int' );
    throws_ok( sub { assert_cmp( 7.0, '<=', 6.0 ) }, $failed, 'float <= float' );
}


NUMERIC_GT: {
    lives_ok( sub { assert_cmp( 1, '>', 0 ) }, 'num > num' );
    lives_ok( sub { assert_cmp( 2, '>', '1' ) }, 'num > str' );
    lives_ok( sub { assert_cmp( '3', '>', 2 ) }, 'str > num' );
    lives_ok( sub { assert_cmp( '4', '>', '3' ) }, 'str > str' );
    lives_ok( sub { assert_cmp( 5, '>', 4.0 ) }, 'int > float' );
    lives_ok( sub { assert_cmp( 6.0, '>', 5 ) }, 'float > int' );
    lives_ok( sub { assert_cmp( 7.0, '>', 6.0 ) }, 'float > float' );

    throws_ok( sub { assert_cmp( 1, '>', 1 ) }, $failed, 'num > num' );
    throws_ok( sub { assert_cmp( 2, '>', '2' ) }, $failed, 'num > str' );
    throws_ok( sub { assert_cmp( '3', '>', 3 ) }, $failed, 'str > num' );
    throws_ok( sub { assert_cmp( '4', '>', '4' ) }, $failed, 'str > str' );
    throws_ok( sub { assert_cmp( 5, '>', 5.0 ) }, $failed, 'int > float' );
    throws_ok( sub { assert_cmp( 6.0, '>', 6 ) }, $failed, 'float > int' );
    throws_ok( sub { assert_cmp( 7.0, '>', 7.0 ) }, $failed, 'float > float' );
}



NUMERIC_GE: {
    lives_ok( sub { assert_cmp( 1, '>=', 1 ) }, 'num >= num' );
    lives_ok( sub { assert_cmp( 2, '>=', '2' ) }, 'num >= str' );
    lives_ok( sub { assert_cmp( '3', '>=', 3 ) }, 'str >= num' );
    lives_ok( sub { assert_cmp( '4', '>=', '4' ) }, 'str >= str' );
    lives_ok( sub { assert_cmp( 5, '>=', 5.0 ) }, 'int >= float' );
    lives_ok( sub { assert_cmp( 6.0, '>=', 6 ) }, 'float >= int' );
    lives_ok( sub { assert_cmp( 7.0, '>=', 7.0 ) }, 'float >= float' );

    throws_ok( sub { assert_cmp( 0, '>=', 1 ) }, $failed, 'num >= num' );
    throws_ok( sub { assert_cmp( 1, '>=', '2' ) }, $failed, 'num >= str' );
    throws_ok( sub { assert_cmp( '2', '>=', 3 ) }, $failed, 'str >= num' );
    throws_ok( sub { assert_cmp( '3', '>=', '4' ) }, $failed, 'str >= str' );
    throws_ok( sub { assert_cmp( 4, '>=', 5.0 ) }, $failed, 'int >= float' );
    throws_ok( sub { assert_cmp( 5.0, '>=', 6 ) }, $failed, 'float >= int' );
    throws_ok( sub { assert_cmp( 6.0, '>=', 7.0 ) }, $failed, 'float >= float' );
}


BAD_NUMBERS: {
    my @operators = qw( == != > >= < <= );

    for my $op ( @operators ) {
        throws_ok( sub { assert_cmp( 12, $op, undef ) }, $failed, "num $op undef" );
        throws_ok( sub { assert_cmp( undef, $op, 12 ) }, $failed, "undef $op num" );
        throws_ok( sub { assert_cmp( undef, $op, undef) }, $failed, "undef $op undef" );
    }
}


STRINGS: {
    lives_ok( sub { assert_cmp( 'a', 'lt', 'b' ) }, 'lt' );
    lives_ok( sub { assert_cmp( 'a', 'le', 'a' ) }, 'le' );
    lives_ok( sub { assert_cmp( 'b', 'gt', 'a' ) }, 'gt' );
    lives_ok( sub { assert_cmp( 'a', 'ge', 'a' ) }, 'ge' );

    throws_ok( sub { assert_cmp( 'a', 'lt', 'a' ) }, $failed );
    throws_ok( sub { assert_cmp( 'b', 'le', 'a' ) }, $failed );
    throws_ok( sub { assert_cmp( 'a', 'gt', 'a' ) }, $failed );
    throws_ok( sub { assert_cmp( 'a', 'ge', 'b' ) }, $failed );
}



BAD_OPERATOR: {
    for my $op ( qw( xx eq ne lte gte LT LE GT GE ), undef ) {
        throws_ok( sub { assert_cmp( 3, $op, 3 ) }, qr/Assertion failed/, 'Invalid op: ' . ($op//'undef') );
    }
}


BAD_VALUES: {
    throws_ok( sub { assert_cmp( 9, '>', undef ) }, $failed, 'undef > float' );
}


exit 0;
